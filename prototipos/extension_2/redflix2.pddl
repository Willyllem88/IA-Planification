(define (domain redflix)
    (:requirements :adl :typing :equality)
    (:types 
        content - object
        day - object)
  
    (:predicates
        (watched ?c - content)
        (is_wanted ?c - content)
        (predecessor ?c1 - content ?c2 - content) ; c1 precede a c2
        (day_to_watch ?c - content ?d - day) ; c se ve en d
        (yesterday ?d1 - day ?d2 - day) ; d1 es el día anterior a d2
        (parallel ?c1 - content ?c2 - content) ; c1 y c2 son contenidos paralelos
        (assigned ?c - content) ; c tiene un día asignado
    )

    ;; Acción para ver un contenido en un día
    (:action add_content
        :parameters (?c - content)
        :precondition (and 
            (is_wanted ?c)
            (not (watched ?c))
        )
        :effect (and 
            ;; Si el contenido visto tiene un sucesor o algun contenido en paralelo a ver y no ha sido visto, se agrega a la lista de contenidos por ver
            (forall (?c2 - content)
                (when (and 
                    (or (predecessor ?c2 ?c)(parallel ?c2 ?c)) 
                    (not (watched ?c2)) 
                    (not (is_wanted ?c2)))
                        (is_wanted ?c2))
            )
        )
    )

    ;; Acción para poner dia a un contenido sin postsucesores
    (:action set_day_unique
        :parameters (?c - content ?d - day)
        :precondition (and 
            (is_wanted ?c)
            (not (watched ?c))
            ;; Verifica que no haya sucesores que no hayan sido vistos
            (not (exists (?c2 - content) 
                (and 
                    (predecessor ?c ?c2)
                    (not (watched ?c2)))))
            ;; Verifica que no haya contenidos paralelos que no hayan sido vistos
            (not (exists (?c2 - content) 
                (and 
                    (parallel ?c ?c2)
                    (not (watched ?c2)))))
        )
        :effect (and 
            (day_to_watch ?c ?d)
            (assigned ?c)
        )
    )  

    ;; Acción para poner dia a un contenido, 
    (:action set_day
        :parameters (?c1 ?c2 - content ?d1 ?d2 - day)
        :precondition (and 
            (is_wanted ?c1)
            (day_to_watch ?c2 ?d2)
            (or 
                ;condiciones para contenido paralelo
                (and
                    (parallel ?c1 ?c2)
                    (or 
                        (yesterday ?d1 ?d2)
                        (= ?d1 ?d2)))
                ;condiciones para contenido predecessor
                (and
                    (predecessor ?c1 ?c2)
                    (yesterday ?d1 ?d2))
            )  
        )
        :effect (and 
            (day_to_watch ?c1 ?d1)
            (assigned ?c1)
        )
    )
)
