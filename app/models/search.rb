class Search
  include ActiveModel::Model

  attr_accessor :countries, :device_ids

  def results_grouped_by_tester
    result_ids = result.ids.to_s.tr("[]", "")
    Tester.
      joins("LEFT JOIN bugs ON bugs.tester_id = testers.id AND bugs.id IN (#{result_ids})").
      group(["testers.first_name", "testers.last_name"]).
      order("count_bugs_tester_id desc").
      count("bugs.tester_id")
  end

  def result
    @_result = begin
                  base_scope = Bug.includes(:tester)

                  if countries.reject(&:empty?).present?
                    base_scope = base_scope.where(testers: { country: countries })
                  end

                  if device_ids.reject(&:empty?).present?
                    base_scope = base_scope.where(device_id: device_ids)
                  end

                  base_scope
                end
  end
end
