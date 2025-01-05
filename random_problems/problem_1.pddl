(define (problem random-redflix-problem)
    (:domain redflix)

    (:objects
        c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 w1 w2 - content
        day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    )

    (:init
        (predecessor c2 c3)
        (predecessor c5 c6)
        (predecessor c7 c8)
        (predecessor c8 c9)
        (predecessor c9 c10)
        (predecessor c10 c11)
        (predecessor c12 c13)
        (predecessor c13 c14)
        (predecessor w1 c10)

        (parallel c1 c6)
        (parallel c4 c10)

        (is_wanted c8)
        (is_wanted c9)
        (is_wanted c5)
        (is_wanted c14)
        (is_wanted c1)
        (is_wanted c2)
        (is_wanted c11)
        (is_wanted c6)

        (watched w1)
        (watched w2)

        (= (duration c1) 48)
        (= (duration c2) 104)
        (= (duration c3) 46)
        (= (duration c4) 41)
        (= (duration c5) 113)
        (= (duration c6) 83)
        (= (duration c7) 70)
        (= (duration c8) 76)
        (= (duration c9) 84)
        (= (duration c10) 72)
        (= (duration c11) 50)
        (= (duration c12) 78)
        (= (duration c13) 53)
        (= (duration c14) 40)
        (= (duration w1) 93)
        (= (duration w2) 50)

        (yesterday day1 day2)
        (yesterday day2 day3)
        (yesterday day3 day4)
        (yesterday day4 day5)
        (yesterday day5 day6)
        (yesterday day6 day7)
        (yesterday day7 day8)
        (yesterday day8 day9)
        (yesterday day9 day10)

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

        (= (total-days) 0)
        (= (remaining-content) 13)
    )

    (:goal
        (and
            (= (remaining-content) 0)
        )
    )

    (:metric minimize (total-days))
)
