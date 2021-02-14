module RequestHelper
  def find_free_operator
    operators = User.where(role: 2).find_each
    free_operator = nil

    min = find_min(operators)

    operators.each do |operator|
      if min == operator.requests.count
        free_operator = operator
        break
      end
    end

    free_operator
  end

  def find_min(operators)
    min = nil

    operators.each do |operator|
      min = operator.requests.count if min.nil? || min > operator.requests.count
    end

    min
  end
end
