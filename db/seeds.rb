# frozen_string_literal: true

# определяем роли футболистов и их количество в каждой команде
roles_count = {
  'goalkeeper': 1,
  'forward': 2,
  'midfielder': 4,
  'defender': 4
}

# определяем название команд
team_names = [
  'Juventus',
  'Real Madrid',
  'Barcelona',
  'Milan',
  'Liverpool',
  'Arcenal',
  'PSG',
  'Manchester Unites',
  'Manchester City'
]

# запускаем цикл на 9 раз (кол-во команд)
team_names.count.times do |i|
  team_name = team_names[i]

# вложенный цикл, который будет повторяться 4 раза (кол-во ролей)
  roles_count.each do |role, count|

   # еще один вложенный цикл на количество каждой роли в команде (1 вратарь, 2 нападающих и тд)
    count.times do
      Footballer.create(name: FFaker::Name.unique.male_name_with_prefix, team: team_name, role: )
    end
  end
end

puts "Successfully created #{Footballer.count} footballers"

matches = Match.create([
  { date: '2023-01-10', weight: 5.0 },
  { date: '2023-01-15', weight: 3.6 },
  { date: '2023-02-20', weight: 4.2 },
  { date: '2023-03-05', weight: 2.9 },
  { date: '2023-04-10', weight: 5.0 },
  { date: '2023-05-15', weight: 4.9 },
  { date: '2023-06-20', weight: 3.3 },
  { date: '2023-07-25', weight: 4.7 },
  { date: '2023-08-30', weight: 2.0 },
  { date: '2023-09-15', weight: 4.0 },
  { date: '2023-10-01', weight: 4.8 },
  { date: '2023-11-10', weight: 3.5 },
  { date: '2023-12-05', weight: 4.1 },
  { date: '2024-01-01', weight: 4.6 }
])

puts "Successfully created #{matches.count} matches"
