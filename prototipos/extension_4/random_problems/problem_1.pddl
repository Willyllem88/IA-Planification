(define (problem random-redflix-problem)
    (:domain redflix)

    (:objects
        c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 w1 w2 - content
        day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
    )

    (:init
        (predecessor c2 c3)
        (predecessor c5 c6)
        (predecessor c11 c12)
        (predecessor c13 c14)
        (predecessor c14 c15)
        (predecessor w2 c6)

        (parallel c8 c6)
        (parallel c7 c14)
        (parallel c10 c2)
        (parallel c7 c2)

        (is_wanted c14)
        (is_wanted c1)
        (is_wanted c6)
        (is_wanted c5)
        (is_wanted c3)

        (watched w1)
        (watched w2)

        (= (duration c1) 80)
        (= (duration c2) 60)
        (= (duration c3) 91)
        (= (duration c4) 81)
        (= (duration c5) 116)
        (= (duration c6) 62)
        (= (duration c7) 49)
        (= (duration c8) 99)
        (= (duration c9) 44)
        (= (duration c10) 112)
        (= (duration c11) 83)
        (= (duration c12) 43)
        (= (duration c13) 100)
        (= (duration c14) 78)
        (= (duration c15) 75)
        (= (duration w1) 41)
        (= (duration w2) 69)

        (yesterday day1 day2)
        (yesterday day2 day3)
        (yesterday day3 day4)
        (yesterday day4 day5)
        (yesterday day5 day6)
        (yesterday day6 day7)
        (yesterday day7 day8)
        (yesterday day8 day9)

        (= (day_duration day1) 0)
        (= (day_duration day2) 0)
        (= (day_duration day3) 0)
        (= (day_duration day4) 0)
        (= (day_duration day5) 0)
        (= (day_duration day6) 0)
        (= (day_duration day7) 0)
        (= (day_duration day8) 0)
        (= (day_duration day9) 0)

        (= (total-days) 0)
        (= (remaining-content) 10)
    )

    (:goal
        (and
            (= (remaining-content) 0)
        )
    )

    (:metric minimize (total-days))
)
