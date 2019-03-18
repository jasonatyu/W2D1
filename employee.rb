class Employee
  attr_reader :name, :title, :salary, :boss 

  def initialize(name, title, salary, boss)
    @name = name 
    @title = title 
    @salary = salary 
    @boss = boss 
  end

  def bonus(multiplier)
    bonus = @salary * multiplier
  end
end



# m.set_employees(e_1)
# m.set_employees(e_2)

class Manager < Employee
  attr_accessor :employees

  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees

  end

  # def set_employees(employee)
  #   @employees << employee
  # end

  def bonus(multiplier=1)
    total_sub_salaries(self) * multiplier 
  end

  def total_sub_salaries(employee)
    return 0 if !employee.is_a?(Manager) 
    total_sum = 0
    employee.employees.each do |sub_employee|
      if sub_employee.is_a?(Manager) 
        total_sum += sub_employee.salary + total_sub_salaries(sub_employee)
      else 
        total_sum += sub_employee.salary  
      end
    end
    total_sum 
  end

end

e_1 = Employee.new('A', 'TA', 10000, 'Ned')
e_2 = Employee.new('B', 'TA', 5000, 'Ned')
m_2 = Manager.new("Darren", "Manager", 25000, 'Ned', [e_2])

m = Manager.new('Ned', 'Founder', 50000, nil, [e_1, m_2]) 
