class Search
  include ActiveModel::Model

  attr_accessor :countries, :device_ids

  def results_grouped_by_tester
    Hash.new(0).merge(results.group(:tester_id).count)
  end

  def results
    @_results = begin
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
