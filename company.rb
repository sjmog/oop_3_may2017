class Ceo
  def initialize(coo = Coo.new)
    @coo = coo
  end

  def make_company_efficient
    report(@coo.find_company_savings)
  end

  private

  def report(savings)
    p savings
  end
end

class Coo
  def initialize(equipment = [], entertainment_budget = 1000, hr_manager)
    @equipment = equipment
    @entertainment_budget = entertainment_budget
    @hr_manager = hr_manager
  end

  def find_company_savings
    sell_old_equipment
    reduce_entertainment_budget
    number_of_employees_fired = @hr_manager.reduce_payroll

    [@equipment, @entertainment_budget, number_of_employees_fired]
  end

  private

  def sell_old_equipment
    @equipment.pop
  end

  def reduce_entertainment_budget
    @entertainment_budget -= 200
  end
end

class HrManager
  def initialize(employees = [])
    @employees = employees
  end

  def reduce_payroll
    @employees.each { |employee| employee.fire if employee.performance < 7 }
    5
  end
end

class Employee
  def fire
    :fired
  end

  def performance
    @performance ||= rand(1..10)
  end
end

employees = [Employee.new, Employee.new, Employee.new, Employee.new, Employee.new]
lydia = HrManager.new(employees)
brad = Coo.new([:table, :chair], 1200, lydia)
ina = Ceo.new(brad)

# RSpec.describe Coo do
#   describe '#find_company_savings' do
#     it 'delegates reducing payroll to hr manager' do
#       double_hr_manager = double
#       test_brad = Coo.new([], 0, double_hr_manager)
#       test_brad.find_company_savings

#       expect(double_hr_manager).to have_received(:reduce_payroll)
#     end
#   end
# end

ina.make_company_efficient





