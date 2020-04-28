class Employee
    attr_reader :name, :title, :salary, :boss, :direct_reports
    def initialize(name, title, salary, boss, direct_reports = nil)
        @name, @title, @salary, @boss, @direct_reports =
            name, title, salary, boss, direct_reports
    end

    def bonus(multiplier) 
        if self.direct_reports != nil
            total = 0
            @direct_reports.each do |employee|
                total += employee.salary
            end
            total * multiplier
        else
         @salary * multiplier
        end
    end
end

class Manager < Employee
    attr_reader :name, :title, :salary, :boss, :direct_reports
    def initialize(name, title, salary, boss, direct_reports)
        @name, @title, @salary, @boss, @direct_reports =
            name, title, salary, boss, direct_reports
        super
    end

    def bonus(multiplier)
        total_subsalary * multiplier
    end

    def total_subsalary
        total_subsalary = 0
        self.direct_reports.each do |direct_report|
            if direct_report.is_a?(Manager)
                total_subsalary += direct_report.salary + direct_report.total_subsalary
            else
                total_subsalary += direct_report.salary
            end
        end
        total_subsalary
    end
end
=begin
Tests

david = Employee.new("David", "TA", 10000, "Darren")
shawna = Employee.new("Shawna", "TA", 12000, "Darren")
darren = Manager.new("Darren", "TA Manager", 78000, "Ned",[david, shawna])
ned = Manager.new("Ned", "Founder", 1000000, nil, [darren])

p darren.bonus(4)
p david.bonus(3)
p ned.bonus(5)
=end