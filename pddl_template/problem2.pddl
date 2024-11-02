(define (problem p2-UpdsideDown)

    (:domain UpdsideDown)
  
    (:objects
    
        cell-1 cell-2 cell- cell-3 cell-4 cell-5 cell-6 cell-7 cell-8 cell-9 cell-10 cell-11 cell-12 cell-13 cell-14 cell-15 - cells
        red green blue - colour
        m1 m2 - matches
        k1 k2 - keys

    )
  
    (:init
  
        ;Initial Hero Location
        (cell-has-hero cell-1)
        
        ;She starts with a free arm
        (hero-hand-empty)
        
        ;Initial location of the keys
        (cell-has-key k1 cell-1)
        (cell-has-key k2 cell-11)
        
        ;Initial location of the matches
        (cell-has-match m1 cell-6)
        (cell-has-match m2 cell-13)
        
        ;Initial location of Monsters
        (cell-has-monster cell-14)
        
        ;Initial lcocation of open gates
        (cell-has-gate-open cell-2 red)
        (cell-has-gate-open cell-3 red)
        (cell-has-gate-open cell-4 red)
        (cell-has-gate-open cell-5 red)
        (cell-has-gate-open cell-7 red)
        (cell-has-gate-open cell-8 red)
        (cell-has-gate-open cell-9 red)
        (cell-has-gate-open cell-10 red)
        (cell-has-gate-open cell-12 green)
        
        ;Key uses
        (key-infinite-uses k1)
        (key-two-use k2)
        
        ;Key Colours
        (key-colour k1 red)
        (key-colour k2 green)
        
        ;Graph Connectivity
        (cell-connected cell-1 cell-3)
        (cell-connected cell-3 cell-1)
        (cell-connected cell-2 cell-3)
        (cell-connected cell-3 cell-2)
        (cell-connected cell-3 cell-4)
        (cell-connected cell-4 cell-3)
        (cell-connected cell-2 cell-5)
        (cell-connected cell-5 cell-2)
        (cell-connected cell-2 cell-6)
        (cell-connected cell-6 cell-2)
        (cell-connected cell-3 cell-6)
        (cell-connected cell-6 cell-3)
        (cell-connected cell-4 cell-6)
        (cell-connected cell-6 cell-4)
        (cell-connected cell-4 cell-7)
        (cell-connected cell-7 cell-4)
        (cell-connected cell-5 cell-6)
        (cell-connected cell-6 cell-5)
        (cell-connected cell-6 cell-7)
        (cell-connected cell-7 cell-6)
        (cell-connected cell-5 cell-8)
        (cell-connected cell-8 cell-5)
        (cell-connected cell-6 cell-8)
        (cell-connected cell-8 cell-6)
        (cell-connected cell-6 cell-9)
        (cell-connected cell-9 cell-6)
        (cell-connected cell-6 cell-10)
        (cell-connected cell-10 cell-6)
        (cell-connected cell-7 cell-10)
        (cell-connected cell-10 cell-7)
        (cell-connected cell-8 cell-9)
        (cell-connected cell-9 cell-8)
        (cell-connected cell-9 cell-10)
        (cell-connected cell-10 cell-9)
        (cell-connected cell-9 cell-11)
        (cell-connected cell-11 cell-9)
        (cell-connected cell-11 cell-12)
        (cell-connected cell-12 cell-11)
        (cell-connected cell-12 cell-13)
        (cell-connected cell-13 cell-12)
        (cell-connected cell-13 cell-14)
        (cell-connected cell-14 cell-13)
        (cell-connected cell-14 cell-15)
        (cell-connected cell-15 cell-14)
    
    )
  
    (:goal 
        (and
        
            ;Hero's Goal Location
            (cell-has-hero cell-15)
            
            ;All gates are closed
            (cell-has-gate-closed cell-2)
            (cell-has-gate-closed cell-3)
            (cell-has-gate-closed cell-4)
            (cell-has-gate-closed cell-5)
            (cell-has-gate-closed cell-7)
            (cell-has-gate-closed cell-8)
            (cell-has-gate-closed cell-9)
            (cell-has-gate-closed cell-10)
            (cell-has-gate-closed cell-12)
                
        )
    )
  
)
