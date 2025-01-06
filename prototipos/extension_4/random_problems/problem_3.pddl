(define (problem random-redflix-problem)
    (:domain redflix)

    (:objects
        c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 w1 - content
        day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
    )

    (:init
        (predecessor c1 c2)
        (predecessor c3 c4)
        (predecessor c4 c5)
        (predecessor c5 c6)
        (predecessor c6 c7)
        (predecessor c7 c8)
        (predecessor c8 c9)
        (predecessor c10 c11)


        (is_wanted c9)
        (is_wanted c5)
        (is_wanted c2)
        (is_wanted c7)
        (is_wanted c3)
        (is_wanted c1)

        (watched w1)

        (= (duration c1) 114)
        (= (duration c2) 100)
        (= (duration c3) 114)
        (= (duration c4) 80)
        (= (duration c5) 44)
        (= (duration c6) 98)
        (= (duration c7) 103)
        (= (duration c8) 108)
        (= (duration c9) 52)
        (= (duration c10) 47)
        (= (duration c11) 116)
        (= (duration w1) 96)

        (yesterday day1 day2)
        (yesterday day2 day3)
        (yesterday day3 day4)
        (yesterday day4 day5)
        (yesterday day5 day6)
        (yesterday day6 day7)
        (yesterday day7 day8)
        (yesterday day8 day9)
        (yesterday day9 day10)
        (yesterday day10 day11)
        (yesterday day11 day12)
        (yesterday day12 day13)

        (= (day_duration day1) 0)
        (= (day_duration day2) 0)
        (= (day_duration day3) 0)
        (= (day_duration day4) 0)
        (= (day_duration day5) 0)
        (= (day_duration day6) 0)
        (= (day_duration day7) 0)
        (= (day_duration day8) 0)
        (= (day_duration day9) 0)
        (= (day_duration day10) 0)
        (= (day_duration day11) 0)
        (= (day_duration day12) 0)
        (= (day_duration day13) 0)

        (= (priority day1) 1)
        (= (priority day2) 2)
        (= (priority day3) 3)
        (= (priority day4) 4)
        (= (priority day5) 5)
        (= (priority day6) 6)
        (= (priority day7) 7)
        (= (priority day8) 8)
        (= (priority day9) 9)
        (= (priority day10) 10)
        (= (priority day11) 11)
        (= (priority day12) 12)
        (= (priority day13) 13)

        (= (total-days) 0)
        (= (remaining-content) 9)
    )

    (:goal
        (and
            (= (remaining-content) 0)
        )
    )

    (:metric minimize (total-days))
)
