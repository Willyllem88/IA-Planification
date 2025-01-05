(define (problem random-redflix-problem)
    (:domain redflix)

    (:objects
        c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 w1 - content
        day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    )

    (:init
        (predecessor c1 c2)
        (predecessor c2 c3)
        (predecessor c3 c4)
        (predecessor c6 c7)
        (predecessor c7 c8)
        (predecessor c8 c9)
        (predecessor c9 c10)
        (predecessor c10 c11)
        (predecessor w1 c1)

        (parallel c5 c7)

        (is_wanted c11)
        (is_wanted c10)
        (is_wanted c5)
        (is_wanted c2)
        (is_wanted c3)
        (is_wanted c4)
        (is_wanted c1)

        (watched w1)

        (= (duration c1) 110)
        (= (duration c2) 108)
        (= (duration c3) 46)
        (= (duration c4) 119)
        (= (duration c5) 81)
        (= (duration c6) 59)
        (= (duration c7) 113)
        (= (duration c8) 79)
        (= (duration c9) 47)
        (= (duration c10) 95)
        (= (duration c11) 94)
        (= (duration w1) 110)

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

        (= (total-days) 0)
        (= (remaining-content) 11)
    )

    (:goal
        (and
            (= (remaining-content) 0)
        )
    )

    (:metric minimize (total-days))
)
