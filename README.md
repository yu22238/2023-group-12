# 2023-group-12
## Team Members 

- Siru Zhang [@DryLichen](https://github.com/DryLichen)
- Yuewen Wang [@Xueling22](https://github.com/Xueling22)
- Shuxing Li [@hingsli](https://github.com/hingsli)
- Francesca Heyworth [@an19149](https://github.com/an19149)
- Zongjian Wang [@wangnevin](https://github.com/wangnevin)

![group photo](./images/team.jpeg)

## Resources
Some game sprite images resources:
- [spriters](https://www.spriters-resource.com/)
- [pixel-frogs](https://pixelfrog-assets.itch.io/)

## Game Ideas

- Angry Birds
- Flappy bird
- Platformer games (e.g. Mario)
- Cut The Rope
- Fruit Ninja
- Stack
- Pinball
- Fireboy and Watergirl
- Temple Run
    - Change the theme, on water, on ice/snow?
    - Might be tricky to animate
- Dinosaur Game
    - Make it two player

## Final Game Idea:

Fireboy and Watergirl
- Add an enemy, what could triger it?
- Adding weapons
- Triger to switch roles
- Boogie traps, e.g. I Wanna
- Make it into a competition - Fireboy vs. Watergirl 
- Add a time limit, the temple slowly filling up with water

## Paper Prototyping Video
https://github.com/UoB-COMSM0110/2023-group-12/blob/f13e531b67bb647df3174490a57dc1f48d43f8c1/Group12-paperprototyping.mp4

## Introduction (5% ~250 words)

o Describe your game, what is based on, what makes it novel?

Enter a world of excitement and intrigue with our 2-player game, which takes inspiration from the wildly popular online game Fireboy and Watergirl. Get ready to embark on an epic journey through a mystical forest temple, filled with intricate puzzles and thrilling adventure.

With this game, players can look forward to testing their problem-solving skills as they work together to overcome obstacles and unlock new challenges. As they navigate through the twisting paths and hidden passageways of the temple, they'll need to utilize their unique strengths and collaborate with each other to reach their ultimate goal - escaping the temple together! With every level presenting new challenges and obstacles, players will need to stay on their toes and think quickly if they want to make it out in time.

In a bid to survive the treacherous forest temple, the dynamic duo of Fireboy and Watergirl must heed one crucial rule: stay in their respective lanes! With Fireboy vulnerable to water and Watergirl equally susceptible to fire, the stakes are high as they navigate through the everchanging environment. However, escaping the temple is not the only aim of the game, players must also keep their eyes peeled for diamonds. Scattered throughout the temple, these precious gems serve as the key to success in the game. The more diamonds players collect, the higher their score will be at the end of the game.

## Requirements (15% ~750 words)

o Use case diagrams, user stories. Early stages design. Ideation process. How did you decide as a team what to develop?

## Design (15% ~750 words)

o System architecture. Class diagrams, behavioural diagrams.

This is the class diagram that illustrates the class hierarchy of our 2D platformer game.
[Class Diagram](./Demo/demo.drawio)
![Class Diagram](./Demo/diagram.png)
### GameObject
The top level of this hierarchy is occupied by the abstract class, GameObject, which is the base class for all visible objects in the game. It contains essential properties such as position, tag, width, and height. Additionally, it has two essential methods: "update" and "display". The "update" method updates the game object's state and is called every 1/120 second. The "display" method is responsible for drawing images on the screen and is called every frame (1/60 second).

The GameObject class has three classes that extend it: Character, Tile, and Bullet. These classes are responsible for creating and managing characters, tiles, and bullets in the game.
### Character
Two subclasses of the Character class are Player and Enemy, which represent the player character and the enemy characters, respectively. The Player and Enemy classes inherit all the properties and methods of the Character class.

The Character class aggregates three classes: Animator, StateMachine, and Collider. This means that, besides inheriting properties, the Character class has instances of these classes, and it can use their functionality to control the state and animation of the character objects in the game.
### Animator
The Animator class has several instances of Animation stored in a HashMap. The keys represent different states, and the values represent instances of Animation. This class can use its functionality to play corresponding animations associated with a given state.
### Collider
Similarly, the Collider class is aggregated by Tile, Bullet and Character classes. The Tile, Bullet and Character classes have instances of Collider, and they can use its functionality to detect collisions between objects in the game. For example, to check if a bullet hits an enemy, or if player is standing on a platform.
### TileMap
The TileMap class is composed of the Tile class, which means that TileMap has all the instances of Tiles. It is used to create and manage tile objects in every map in the game.
### Bullets
The Bullets class is composed of the Bullet class, which means that Bullets has all the instances of Bullet, and it can use its functionality to create and manage bullet objects in the game.
### Enemies
Similar to Bullets class to Bullet, the Enemies class is composed of the Enemy class, and has all the instances of Enemy. It can use its functionality to create and manage all enemies in the game.
### InputManager
The InputManager class is aggregated by the Player class, which means that the Player class has an instance of InputManager, and it can use its functionality to handle user input for the player character in the game. Since this game is a multiplayer game with two players, each player has an inputManager that responds to its unique keyboard input.
### Game
Finally, the instances of TileMap, Bullets, Enemies, and Player are compositions of the Game class, which is a class for managing all the objects and game states. This means that the Game class has instances of these classes, along with other properties like gameStart and stage. Its functionality can be used to create and manage the different game state, like “game start” or “game over”, and game scenes, like “level 1” and “level 2”.


## Implementation (15% ~750 words)

o Describe implementation of your game, in particular highlighting the three areas of challenge in developing your game.

## Evaluation (15% ~750 words)

o One qualitative evaluation (your choice)

Think Aloud Evaluation:
- Need to deal with bullets off screen, deleting them when they leave the screen so that the game does not glitch
- Need to add instructions to make it clear which keys to use to move and how to shoot
- Using space to jump? More clear?
- Cannot press W&A at the same time
- Can not distinguish between player and enemies

Heuristics Evaluation:
1. Visibility of system status
   - Can not distinguish between player and enemies
2. Consistency and standards
   - Using space to jump?
3. Error prevention
   - Need to deal with bullets off screen, deleting them when they leave the screen so that the game does not glitch
   - Cannot press W&A at the same time
4. Help and documentation
   - Need to add instructions to make it clear which keys to use to move and how to shoot

o One quantitative evaluation (of your choice)

o Description of how code was tested.

## Process (15% ~750 words)

o Teamwork. How did you work together, what tools did you use. Did you have team roles? Reflection on how you worked together.

## Conclusion (10% ~500 words)

o Reflect on project as a whole. Lessons learned. Reflect on challenges. Future work.

## Individual contribution. 
Provide a table of everyone's contribution, which may be used to weight individual grades. We expect that the contribution will be split evenly across team-members in most cases. Let us know as soon as possible if there are any issues with teamwork as soon as they are apparent.

