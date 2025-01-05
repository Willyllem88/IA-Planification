(define (problem random-redflix-problem)
    (:domain redflix)

    (:objects
        c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 w1 w2 - content
        day1 day2 day3 day4 day5 day6 day7 day8 - day
    )

    (:init
        (predecessor c1 c2)
        (predecessor c3 c4)
        (predecessor c5 c6)
        (predecessor c6 c7)
        (predecessor c8 c9)
        (predecessor c9 c10)
        (predecessor c11 c12)
        (predecessor c13 c14)


        (is_wanted c4)
        (is_wanted c13)
        (is_wanted c1)
        (is_wanted c12)
        (is_wanted c7)
        (is_wanted c8)
        (is_wanted c11)

        (watched w1)
        (watched w2)

        (= (duration c1) 81)
        (= (duration c2) 64)
        (= (duration c3) 43)
        (= (duration c4) 90)
        (= (duration c5) 101)
        (= (duration c6) 92)
        (= (duration c7) 78)
        (= (duration c8) 48)
        (= (duration c9) 109)
        (= (duration c10) 90)
        (= (duration c11) 107)
        (= (duration c12) 97)
        (= (duration c13) 78)
        (= (duration c14) 97)
        (= (duration w1) 90)
        (= (duration w2) 76)

        (yesterday day1 day2)
        (yesterday day2 day3)
        (yesterday day3 day4)
        (yesterday day4 day5)
        (yesterday day5 day6)
        (yesterday day6 day7)
        (yesterday day7 day8)

        (= (day_duration day1) 0)
        (= (day_duration day2) 0)
        (= (day_duration day3) 0)
        (= (day_duration day4) 0)
        (= (day_duration day5) 0)
        (= (day_duration day6) 0)
        (= (day_duration day7) 0)
        (= (day_duration day8) 0)

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
