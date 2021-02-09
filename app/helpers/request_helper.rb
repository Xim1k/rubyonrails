module RequestHelper
    def findFreeOperator
        operators = User.where(role: 2).find_each
        min = nil
        freeOperator = nil

        operators.each do |operator|
            if min.nil? || min > operator.requests.count
                min = operator.requests.count
            end
        end

        operators.each do |operator|
            if min == operator.requests.count
                freeOperator = operator
                break
            end
        end

        freeOperator
    end
end
