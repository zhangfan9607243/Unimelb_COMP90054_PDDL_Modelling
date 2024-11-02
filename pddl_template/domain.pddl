(define (domain UpdsideDown)

    (:requirements
        :typing
        :negative-preconditions
        :conditional-effects
    )

    (:types
        matches keys - items
        cells
        colour
    )

    (:predicates
        ;Predicates about matches
        (match-fire) ;Match on fire 
        
        ;Predicates about keys
        (key-infinite-uses ?key - keys) ;Key usage infinite
        (key-two-use ?key - keys) ;Key usage one time remaining 
        (key-one-use ?key - keys) ;Key usage two times remaining
        (key-used-up ?key - keys) ;Key used up
        (key-colour ?key - keys ?colour - colour) ;Key colour
        
        ;Predicates about cells
        (cell-has-hero ?cell - cells) ;Cell has the hero
        (cell-has-monster ?cell - cells) ;Cell has the monster
        (cell-has-key ?key -keys ?cell - cells) ;Cell has a key
        (cell-has-match ?match - matches ?cell - cells) ;Cell has a match
        (cell-has-gate-open ?cell - cells ?colour - colour) ;Cell has an open gate
        (cell-has-gate-closed ?cell - cells) ;Cell has a closed gate
        (cell-visited ?cell - cells) ;Cell has been visited
        (cell-connected ?cell-a ?cell-b - cells) ;Two cells are connected
        
        ;Predicates about hero
        (hero-hand-empty) ;Hero holds nothing
        (hero-has-key ?key - keys) ;Hero holds a key
        (hero-has-match ?match - matches) ;Hero holds a match
    )

    ;When this action is executed, hero move between cells, and the original cell becomes invigilated.
    (:action move
        :parameters (?from ?to - cells)
        :precondition (and
            ;Hero is at "from" location
            (cell-has-hero ?from)
            ;"To" location not visited
            (not (cell-visited ?to))
            ;Two cells are connected
            (cell-connected ?from ?to)
            ;(or (cell-connected ?from ?to) (cell-connected ?to ?from))
            ;Not consider monsters here
            (not (cell-has-monster ?from))
            (not (cell-has-monster ?to))
        )
        :effect (and 
            ;Hero is not at "from" location
            (not (cell-has-hero ?from))
            ;Hero is at "to" location
            (cell-has-hero ?to)
            ;"From" location has been visited
            (cell-visited ?from)
            ;Match should not on fire once move
            (not (match-fire))
        )
    )
    
    ;When this action is executed, the hero leaves a location with a monster in it
    (:action move-out-of-monster
        :parameters (?from ?to - cells)
        :precondition (and
            ;Hero is at "from" location
            (cell-has-hero ?from)
            ;"To" location not visited
            (not (cell-visited ?to))
            ;Two cells are connected
            (cell-connected ?from ?to)
            ;(or (cell-connected ?from ?to) (cell-connected ?to ?from))
            ;Monster is at "from" location
            (cell-has-monster ?from)
            ;Monster is not at "to" location
            (not (cell-has-monster ?to))
            ;Match on fire
            (match-fire)
        )
        :effect (and
            ;Hero is not at "from" location
            (not (cell-has-hero ?from))
            ;Hero is at "to" location
            (cell-has-hero ?to)
            ;"From" location has been visited
            (cell-visited ?from)
            ;Match should not on fire once move
            (not (match-fire))
        )
    )

    ;When this action is executed, the hero leaves a location without a monster and gets into a location with a monster
    (:action move-into-monster
        :parameters (?from ?to - cells ?m - matches)
        :precondition (and
            ;Hero is at "from" location
            (cell-has-hero ?from)
            ;"To" location not visited
            (not (cell-visited ?to))
            ;Two cells are connected
            (cell-connected ?from ?to)
            ;(or (cell-connected ?from ?to) (cell-connected ?to ?from))
            ;Monster is at "to" location
            (cell-has-monster ?to)
            ;Monster is not at "from" location
            (not (cell-has-monster ?from))
            ;Hero has a match
            (hero-has-match ?m)
        )
        :effect (and 
            ;Hero is not at "from" location
            (not (cell-has-hero ?from))
            ;Hero is at "to" location
            (cell-has-hero ?to)      
            ;"From" location has been visited
            (cell-visited ?from)
            ;Match should not on fire once move
            (not (match-fire))
        )
    )
    
    ;Hero's picks a key if he's in the same location
    (:action pick-key
        :parameters (?loc - cells ?k - keys)
        :precondition (and 
            ;Current location has a key
            (cell-has-key ?k ?loc)
            ;Current location has the hero
            (cell-has-hero ?loc)
            ;Hero hands empty
            (hero-hand-empty)
        )
        :effect (and
            ;Current location has no key
            (not (cell-has-key ?k ?loc))
            ;Hero holds the key
            (hero-has-key ?k)
            ;Hero hands not empty
            (not (hero-hand-empty))
        )
    )

    ;Hero's picks a match if he's in the same location
    (:action pick-match
        :parameters (?loc - cells ?m - matches)
        :precondition (and 
            ;Current location has a match
            (cell-has-match ?m ?loc)
            ;Current location has the hero
            (cell-has-hero ?loc)
            ;Hero hands empty
            (hero-hand-empty)
        )
        :effect (and
            ;Current location has no match
            (not (cell-has-match ?m ?loc))
            ;Hero holds the match
            (hero-has-match ?m)
            ;Hero hands not empty
            (not (hero-hand-empty))
        )
    )
    
   ;Hero's drops his key. 
    (:action drop-key
        :parameters (?loc - cells ?k - keys)
        :precondition (and
            ;Current location has the hero
            (cell-has-hero ?loc)
            ;Hero holds the key
            (hero-has-key ?k)
        )
        :effect (and
            ;Current location has a key
            (cell-has-key ?k ?loc)
            ;Hero hands empty
            (hero-hand-empty)
            ;Hero not holds the key
            (not (hero-has-key ?k))
        )
    )

    ;Hero's drops his match. 
    (:action drop-match
        :parameters (?loc - cells ?m - matches)
        :precondition (and 
            ;Current location has the hero
            (cell-has-hero ?loc)
            ;Hero holds the match
            (hero-has-match ?m)
        )
        :effect (and
            ;Current location has a match
            (cell-has-match ?m ?loc)
            ;Hero hands empty
            (hero-hand-empty)
            ;Hero not holds the match
            (not (hero-has-match ?m))
        )
    )
    
    ;Hero's disarm the trap with his hand
    (:action close-gate
        :parameters (?from ?to - cells ?k - keys ?c - colour)
        :precondition (and
            ;Hero is at "from" location
            (cell-has-hero ?from)
            ;Two cells are connected
            (cell-connected ?from ?to)
            ;(or (cell-connected ?from ?to) (cell-connected ?to ?from))
            ;"To" cell has an open gate
            (cell-has-gate-open ?to ?c)
            ;Hero holds a key
            (hero-has-key ?k)
            ;Key colour matches gate colour
            (key-colour ?k ?c)
            ;Key is still usable
            (or (key-infinite-uses ?k) (key-two-use ?k) (key-one-use ?k))
        )
        :effect (and
            ;"To" cell has a closed gate
            (cell-has-gate-closed ?to)
            ;When a key has two uses, then it becomes a single use
            (when (key-two-use ?k) (key-one-use ?k))
            ;When a key has a single use, it becomes used-up
            (when (key-one-use ?k) (key-used-up ?k))       
        )
    )

    ;Hero strikes her match
    (:action strike-match
        :parameters (?m - matches)
        :precondition (and 
            ;Hero holds a match
            (hero-has-match ?m)
        )
        :effect (and 
            ;Match on fire
            (match-fire)               
        )
    )
    
)
