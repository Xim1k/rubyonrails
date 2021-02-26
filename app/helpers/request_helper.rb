module RequestHelper
  def find_free_operator
    operators = User.where(role: 2).find_each
    free_operator = nil

    min = find_min(operators)

    operators.each do |operator|
      if min == count_requests(operator)
        free_operator = operator
        break
      end
    end

    free_operator
  end

  def find_min(operators)
    min = nil

    operators.each do |operator|
      min = count_requests(operator) if min.nil? || min > count_requests(operator)
    end

    min
  end

  def count_requests(operator)
    Request.where(operator: operator).count
  end
end
