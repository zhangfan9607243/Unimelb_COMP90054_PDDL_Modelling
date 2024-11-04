# Unimelb COMP90054 PDDL Modelling

## Acknowledgement

I would like to extend my sincere gratitude to the Unimelb COMP90054 2022S2 teaching team for providing me with the opportunity to work on this project, as well as for their guidance and feedback on my work.

## Project Introduction

This project focuses on PDDL (Planning Domain Definition Language) modeling through a complex problem-solving scenario within a game environment. The game involves creating a PDDL model to help a hero escape from a maze known as the UpsideDown. The following is a detailed game instruction:

**Help the hero escape a maze called the UpsideDown!** A hero wakes up in the UpsideDown after a rough night and wants to return home to Melbourne. The UpsideDown is a maze filled with monsters called Demogorgons and gates. To get home, the hero must close all the gates to prevent the monsters from following. The goal is simple: close all the gates and get back home. Here’s what you need to know about the UpsideDown:

* The UpsideDown is made up of rooms connected by corridors, like an undirected graph.
* Rooms can be  **empty** , or they can have a  **Demogorgon** , a  **key** , or a  **match** .
* One of the empty rooms is the  **home** , which is where the hero needs to go.

The hero knows the layout of the UpsideDown completely. However, once they leave a room, that room becomes **invigilated** by **Vecna** and can't be entered again.

The hero can only take actions if they are alive:

* **Move** : The hero can move to any connected room that hasn’t been invigilated yet. To enter a room with a monster, the hero needs a match.
* **Pickup** : The hero can pick up a match or a key if their hands are empty.
* **Drop** : The hero can drop a match or a key, leaving it in the room, so they can pick up another item.
* **Strike a match** : The hero must strike a match before leaving a room with a monster to survive. Monsters are scared of fire, but the match burns out after the hero moves. The match doesn’t disappear; the hero must drop it to pick up another item.
* **Close a Gate** : If there is a gate in a connected room, and the hero has the correct key with enough uses left, the hero can close the gate. After closing a gate, the key's usage count decreases. Keys include:
* Single-use keys (used once)
* Double-use keys (used twice)
* Master keys (used unlimited times)

The hero needs to manage keys and matches carefully, as rooms can only be visited once.

The problems are defined by the following graphs using the legend below:
<img width="802" alt="截屏2024-11-04 14 04 30" src="https://github.com/user-attachments/assets/7a27e353-c654-4ce0-8de3-f2a800e0ab48">


## Problems

### Problem 1
<img width="713" alt="截屏2024-11-04 14 35 20" src="https://github.com/user-attachments/assets/15c5b1ad-ee79-456c-b3d3-85dfe0123ca4">



The related files:

* Domain PDDL: `pddl_template/domain.pddl`
* Problem PDDL: `pddl_template/problem1.pddl`
* Solution: `solutions/solution_problem1.txt`

### Problem 2

<img width="628" alt="截屏2024-11-04 14 35 31" src="https://github.com/user-attachments/assets/608beec8-f4d1-4a03-8921-f09e4fb4c025">


The related files:

* Domain PDDL: `pddl_template/domain.pddl`
* Problem PDDL: `pddl_template/problem2.pddl`
* Solution: `solutions/solution_problem2.txt`

### Problem 3

<img width="1054" alt="截屏2024-11-04 14 35 40" src="https://github.com/user-attachments/assets/4d39c20a-f20e-4a93-8178-18c7a0adb42e">


The related files:

* Domain PDDL: `pddl_template/domain.pddl`
* Problem PDDL: `pddl_template/problem3.pddl`
* Solution: `solutions/solution_problem3.txt`

### Problem 4
In this problem, I was asked to design a maze and model it. I just designed a simple linear maze.


The related files:

* Domain PDDL: `pddl_template/domain.pddl`
* Problem PDDL: `pddl_template/problem4.pddl`
* Solution: `solutions/solution_problem4.txt`

## Code Instruction
The platform I use to write PDDL template and solve the problems is PDDL Editor: https://editor.planning.domains/.

In the main interface, you can edit PDDL files directly or upload PDDL files you've prepared locally.
![1730702380065](https://github.com/user-attachments/assets/40e34f8a-5f8b-4d04-8433-d1c6b13db6f2)


Once you've prepared the domain and problem PDDL files, click on 'Solver' in the menu. Select the domain and problem files, choose a solver, and then click 'Plan.' The solver will generate a solution for the problem.
![1730702438260](https://github.com/user-attachments/assets/c9ec678c-0ceb-4c38-8a72-8b745e14c318)
![1730702559833](https://github.com/user-attachments/assets/e3bdbbf5-34c9-4deb-9a11-229c99b2b768)


Afterward, the solution can be saved locally as a .txt file.
![1730702639739](https://github.com/user-attachments/assets/17995e84-76ac-4fbf-a5b5-0cc8ee164e1f)
![1730702679479](https://github.com/user-attachments/assets/de531b74-39df-4a43-8c1a-bd54feeab278)

