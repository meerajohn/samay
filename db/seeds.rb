# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

puts 'Seeding Default Users...'
admin = User.create! email: 'admin@samay.local', password: 'samyukti', password_confirmation: 'samyukti'

puts 'Seeding Default Roles...'
role_admin = Role.create! name: 'admin'
Role.create! name: 'auditor'
Role.create! name: 'manager'
Role.create! name: 'employee'

puts 'Seeding Default User Role Associations...'
admin.roles << role_admin

puts 'Seeding Demo Data...'
y01 = Division.create! parent_id: '01', code: 'D1001', name: 'Production and planning'

r01 = Client.create! code: 'C1001', name: 'Jane Cristo', contact: '91-9987569478'

Project.create! code: 'Pr1001', name: 'TimeSeet Entry System', division: y01, client: r01, manager_id: '25'

p01 = Department.create! code: 'Dp1001', name: 'Production Department', kind: 'Purchasing department', manager_id: '25'

Employee.create! code: 'Em1001', name: 'John Doe', department: p01, designation: 'Project Leader', manager_id: '25', address: Address.create!
