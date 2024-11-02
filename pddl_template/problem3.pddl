(define (problem p3-UpdsideDown)

    (:domain UpdsideDown)
  
    (:objects
  
        cell-1 cell-2 cell-3 cell-4 cell-5 cell-6 cell-7 cell-8 cell-9 cell-10 cell-11 cell-12 cell-13 - cells
        red green blue - colour
        m1 - matches
        k1 k2 k3 - keys

    )
  
    (:init
  
        ;Initial Hero Location
        (cell-has-hero cell-1)
        
        ;She starts with a free arm
        (hero-hand-empty)
        
        ;Initial location of the keys
        (cell-has-key k1 cell-9)
        (cell-has-key k2 cell-5)
        (cell-has-key k3 cell-12)
        
        ;Initial location of the matches
        (cell-has-match m1 cell-5)
        
        ;Initial location of Monsters
        (cell-has-monster cell-11)
        
        ;Initial lcocation of open gates
        (cell-has-gate-open cell-2 red)
        (cell-has-gate-open cell-3 red)
        (cell-has-gate-open cell-7 red)
        (cell-has-gate-open cell-8 red)
        (cell-has-gate-open cell-10 red)
        (cell-has-gate-open cell-4 green)
        (cell-has-gate-open cell-6 green)
        (cell-has-gate-open cell-12 blue)
        
        ;Key uses
        (key-infinite-uses k1)
        (key-two-use k2)
        (key-one-use k3)
        
        ;Key Colours
        (key-colour k1 red)
        (key-colour k2 green)
        (key-colour k3 blue)
        
        ;Graph Connectivity
        (cell-connected cell-1 cell-2)
        (cell-connected cell-2 cell-1)
        (cell-connected cell-1 cell-8)
        (cell-connected cell-8 cell-1)
        (cell-connected cell-2 cell-3)
        (cell-connected cell-3 cell-2)
        (cell-connected cell-2 cell-9)
        (cell-connected cell-9 cell-2)
        (cell-connected cell-3 cell-8)
        (cell-connected cell-8 cell-3)
        (cell-connected cell-8 cell-9)
        (cell-connected cell-9 cell-8)
        (cell-connected cell-3 cell-4)
        (cell-connected cell-4 cell-3)
        (cell-connected cell-3 cell-10)
        (cell-connected cell-10 cell-3)
        (cell-connected cell-4 cell-9)
        (cell-connected cell-9 cell-4)
        (cell-connected cell-9 cell-10)
        (cell-connected cell-10 cell-9)
        (cell-connected cell-4 cell-5)
        (cell-connected cell-5 cell-4)
        (cell-connected cell-4 cell-11)
        (cell-connected cell-11 cell-4)
        (cell-connected cell-5 cell-10)
        (cell-connected cell-10 cell-5)
        (cell-connected cell-10 cell-11)
        (cell-connected cell-11 cell-10)
        (cell-connected cell-5 cell-6)
        (cell-connected cell-6 cell-5)
        (cell-connected cell-5 cell-12)
        (cell-connected cell-12 cell-5)
        (cell-connected cell-6 cell-11)
        (cell-connected cell-11 cell-6)
        (cell-connected cell-11 cell-12)
        (cell-connected cell-12 cell-11)
        (cell-connected cell-6 cell-7)
        (cell-connected cell-7 cell-6)
        (cell-connected cell-6 cell-13)
        (cell-connected cell-13 cell-6)
        (cell-connected cell-7 cell-12)
        (cell-connected cell-12 cell-7)
        (cell-connected cell-12 cell-13)
        (cell-connected cell-13 cell-12)
        
    )
    
    (:goal 
        (and
        
            ;Hero's Goal Location
            (cell-has-hero cell-13)
                
            ;All gates are closed
                (cell-has-gate-closed cell-2)
                (cell-has-gate-closed cell-3)
                (cell-has-gate-closed cell-7)
                (cell-has-gate-closed cell-8)
                (cell-has-gate-closed cell-10)
                (cell-has-gate-closed cell-4)
                (cell-has-gate-closed cell-6)
                (cell-has-gate-closed cell-12)
                
        )
    )
  
)
