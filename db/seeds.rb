30.times do |number|
  start_start_day = DateTime.new(2023, 9, 1, 0, 0)
  start_end_day = DateTime.new(2023, 9, 30, 0, 0)
  end_start_day = DateTime.new(2024, 9, 1, 0, 0)
  end_end_day = DateTime.new(2024, 9, 30, 0, 0)
  Schedule.create(
    user_id: 1,
    start_datetime: Random.rand(start_start_day..start_end_day),
    finish_datetime: Random.rand(end_start_day..end_end_day),
    content: 'test_content' + number.to_s
  )
end