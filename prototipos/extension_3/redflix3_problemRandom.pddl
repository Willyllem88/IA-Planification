(define (problem random-redflix-problem)
    (:domain redflix)

    (:objects
        c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 w1 w2 w3 - content
        day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
    )

    (:init
        (predecessor c1 c2)
        (predecessor c2 c3)
        (predecessor c3 c4)
        (predecessor c4 c5)
        (predecessor c12 c13)
        (predecessor c13 c14)
        (predecessor c16 c17)
        (predecessor w1 c1)

        (parallel c9 c12)
        (parallel c18 c3)
        (parallel c15 c9)
        (parallel w2 c12)
        (parallel w3 c12)

        (is_wanted c4)
        (is_wanted c10)
        (is_wanted c5)

        (watched w1)
        (watched w2)
        (watched w3)

        (yesterday day1 day2)
        (yesterday day2 day3)
        (yesterday day3 day4)
        (yesterday day4 day5)
        (yesterday day5 day6)
        (yesterday day6 day7)
        (yesterday day7 day8)
        (yesterday day8 day9)

    )

    (:goal
        (and
            (day_to_watch c1 day1)
            (assigned c18)
            (assigned c10)
          
        )
    )

)
