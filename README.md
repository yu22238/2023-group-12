<h1>
Overview of Software Engineering Project Report<br>Fireboy & Watergirl
</h1>

## Demo Video

Click [here](https://youtu.be/AMvl-hmNSHo) to see our video!

## 1. Team

- 2023-group-12

| Member Name | Email | Github account |
| :---: | :-----: | :-------: |
| Siru Zhang | ac22915@bristol.ac.uk | [@DryLichen](https://github.com/DryLichen) |
| Yuewen Wang | xu22227@bristol.ac.uk | [@Xueling22](https://github.com/Xueling22) |
| Shuxing Li | shuxing.li.2022@bristol.ac.uk | [@hingsli](https://github.com/hingsli) |
| Francesca Heyworth | an19149@bristol.ac.uk | [@an19149](https://github.com/an19149) |
| Zongjian Wang | qf22311@bristol.ac.uk | [@wangnevin](https://github.com/wangnevin) |

![group photo](./Teamphoto/team.jpeg)

## 2. Introduction (5%  ~250 words)

Enter a world of excitement and intrigue with our 2-player game, which takes inspiration from the wildly popular online game Fireboy and Watergirl. Get ready to embark on an epic journey through a mystical forest temple, filled with intricate puzzles and thrilling adventure.

With this game, players can look forward to testing their problem-solving skills as they work together to overcome obstacles and unlock new challenges. As they navigate through the twisting paths and hidden passageways of the temple, they'll need to utilize their unique strengths and collaborate with each other to reach their ultimate goal - escaping the temple together! With every level presenting new challenges and obstacles, players will need to stay on their toes and think quickly if they want to make it out.

In a bid to survive the treacherous forest temple, the dynamic duo of Fireboy and Watergirl must heed one crucial rule: stay in their respective lanes! With Fireboy vulnerable to water and Watergirl equally susceptible to fire, the stakes are high as they navigate through the ever-changing environment. But to make matters worse, they both must stay away from the hazardous green sludge. 

As a unique twist, we have incorporated enemies into each level. Players can eliminate these enemies by shooting them, but coming into contact with them will result in instant death and force the players to restart the level.

In order to complete each level and escape from the temple, players must work together to collect all diamonds and reach their designated doors.

## 3. Requirements (15% ~750 words)

### 3.1 Use Case:
[Use Case Diagram](./Demo/usecasediagram1.png) please click here.
![Usecase Diagram](./Demo/usecasediagram1.png)

### 3.2 User Stories:
- As a player, I want to move and jump so that I can arrive at the destination gate and avoid obstacles.
- As a player, I want to shoot bullets so that I can kill enemies to avoid harm.
- As a player, I want to collect diamonds so that I can meet the winning condition.
- As a player, I want to trigger mechanisms to clear obstacles or use the blocker as a springboard.
- As a player, I want to get a tutorial at the beginning of the game so that I can know how the game works.
- As a player, I want to restart in the middle of the game so that I can start the level again if players die.
- As a player, I want to know when I'm going to pass the whole game so I can finish the game.

### 3.3 Overview: 
Development of a two-player game for collaborative play, similar to “Fireboy and Watergirl". It implements basic player movement, multiple interactive elements such as diamonds that can be collected, mechanisms that can be triggered, etc., and the game twists on enemies and weapons. The game contains several levels where the player can control the movement of the corresponding characters and move to the next level when the winning conditions are met and the end gate is entered, avoiding traps and defeating enemies if necessary.

### 3.4 Objective:
- Develop fun and challenging games that reach a wider audience and allow multiple players to participate. 
- Each level is progressively more difficult, including cooperative difficulty and operational difficulty. 
- Easy to learn and smooth to operate.
- Give players the necessary guidance at certain times, such as operation tutorials and playing animations.

### 3.5 Ideation process:
We browsed two resource websites: spriters and pixel-frogs, and we listed several game ideas, including classics such as Angry Birds, Flappy Bird, Cut The Rope, Fruit Ninja, etc.

We discussed several prototypes and analyzed their technical difficulties, gameplay, audience, and how they could twist based on their original designs. Eventually, we chose to twist "Fireboy and Watergirl", a game that has a wide audience, is lightweight, and has an excellent playing experience. We also brainstormed other games to find the appropriate aspects to twist for providing a richer experience for players. 

### 3.6 Early Stages Design:
We chose to implement the original content of "Fireboy and Watergirl", with two players, traps, and levels. There are the classic actions of a 2D game: basic movement and jumping, as well as interactive elements, including river traps to jump over in the levels, players need to determine whether their character will drown in that river, and the ability to trigger blocker mechanisms and collect diamonds, but the difference is that we wanted to increase the difficulty of the game so that players must ensure that all the diamonds are collected in each level. 

This is a two-player game, both players must work together to solve the problem at hand and both enter their corresponding destination gates before they can finish the game. The game twist in adding enemies and handheld weapons for players, which were not present in the original "Fireboy and Watergirl", the player needs to kill the enemies if necessary, and if touches enemies while they are moving they will reduce their life expectancy and cause the player to die, so killing the enemies and then safely crossing over to where they occupied before. This makes for a very multi-dimensional experience: a collaborative multiplayer experience, the brainstorming process of solving trap puzzles, and the thrill of killing enemies.

All characters and interactable elements should be lifelike, for example, characters marching in different directions and dying are matched with corresponding animation effects, interactable elements disappear if they are acquired, mechanisms move position if their buttons are triggered, etc., all of which can tell to the players about their status so that the players can react accordingly.

Given that we need to develop a game together, we also need a careful division of labor. So we have also considered the technical aspects, including the basic classes and methods, to achieve development under a unified standard. As required, the entire game needed to programmed by Processing. We have decided the GameObject as the parent class for all objects, which is updated and displayed through the update and display methods, and its subclasses include elements that need to be saved in the game, such as Character, Tile, Bullet, River, Diamond, Mechanism, etc. The class related to character is Character, and Player and Enemy are subclasses of it.

To manage the game's different states and scenes, we designed the LevelManager class, which could implement judging winning conditions, load different levels, manage the start and pass animations, etc. The LevelManager would instantiate the Game class, which would contain subclass instances es of the GameObject Class.

Overall, our team's goal is to develop a challenging and entertaining two-player game that appeals to a wide audience by brainstorming and carefully planning the game's ideation and technical aspects.

[Paper Prototyping Video](https://github.com/UoB-COMSM0110/2023-group-12/blob/f13e531b67bb647df3174490a57dc1f48d43f8c1/Group12-paperprototyping.mp4)


## 4. Design (15% ~750 words)

This is the class diagram that illustrates the class hierarchy of our 2D platformer game.
[Class Diagram](./Demo/demo.drawio)
![Class Diagram](./Demo/FulDiagram.png)

### 4.1 GameObject
The top level of this hierarchy is occupied by the abstract class, GameObject, which is the base class for all visible objects in the game. It contains essential properties such as position, tag, width, and height. Additionally, it has two essential methods: "update" and "display". The "update" method updates the game object's state and is called every 1/120 second. The "display" method is responsible for drawing images on the screen and is called every frame (1/60 second).

The GameObject class has several classes that extend it, including Character, Tile, Bullet, Diamond, River, DestinationGate, Button and Blocker. These classes are responsible for creating and managing characters, tiles, and all the interactive elements in the game.

### 4.2 Character
Two subclasses of the Character class are Player and Enemy, which represent the player character and the enemy characters, respectively. The Player and Enemy classes inherit all the properties and methods of the Character class, which handles the collision detection between character and platform while moving.

The players have the abilities of jumping and firing bullets, they can also collet diamonds in the map. Every enemy in scene has a patrol area in which they move from left to right. The bullets can reduce to health of hitted enemies, and players will lose health once touched the enemies as well.

There are two players in the game, namely Watergirl and Fireboy, which all extends from Player class, and four types of enemies namely Cucumber, Pirate, Captain and BigGuy, which all extends Enemy class. 

The Character class aggregates three classes: Animator, StateMachine, and Collider. This means that, besides inheriting properties, the Character class has instances of these classes, and it can use their functionality to control the state and animation of the character objects in the game.

### 4.3 Animator
The Animator class has several instances of Animation stored in a HashMap. The keys represent different states, and the values represent instances of Animation. This class can use its functionality to play corresponding animations associated with a given state.

### 4.4 Collider
Similarly, the Collider class is aggregated by Tile, Bullet and Character classes. The Tile, Bullet and Character classes have instances of Collider, and they can use its functionality to detect collisions between objects in the game. For example, to check if a bullet hits an enemy, or if player is standing on a platform.

### 4.5 TileMap
The TileMap class is composed of the Tile class, which means that TileMap has all the instances of Tiles. It is used to create and manage tile objects in every map in the game.

### 4.6 Diamonds, Rivers, Mechanism, DestinationGate
The Diamonds class is composed of Diamond class, the Rivers class is composed of River class and Mechanism class is composed of Button and Blocker cass. These are all elements that players can interact with. For example, players can collect diamonds, rivers can kill the players once touched. The blockers are controlled by buttons that when player stands on buttons, the blocker will be removed from path. To finish the level, players need to reach their corresponding gates, which are instance of DestinationGate class.

### 4.7 Bullets
The Bullets class is composed of the Bullet class, which means that Bullets has all the instances of Bullet, and it can use its functionality to create and manage bullet objects in the game. A new oject of bullet is created and added to bullets once player fired.

### 4.8 Enemies
Similar to Bullets class to Bullet, the Enemies class is composed of the Enemy class, and has all the instances of Enemy. It can use its functionality to create and manage all enemies in the game.

### 4.9 InputManager
The InputManager class is aggregated by the Player class, which means that the Player class has an instance of InputManager, and it can use its functionality to handle user input for the player character in the game. Since this game is a multiplayer game with two players, each player has an inputManager that responds to its unique keyboard input.

### 4.10 Game
The instances of TileMap, Bullets, Enemies, Diamonds, Rivers, Mechanism Watergirl and Fireboy are compositions of the Game class, which is a class for managing all the objects and game states. This means that the Game class has instances of these classes, along with other properties like gameStart and stage. Its functionality can be used to create and manage the different game state, like “game start” or “game over”, and game scenes, like “level 1” and “level 2”. It is also responsible for respawning enemies and players in every level and setting up the platform and interactive elements in scene.

### 4.11 LevelManager
This class is responsible for managing the state of levels and transition between different levels. For example, the level will be increased once players clear current level, and the level can be reset by pressing 'R' on the keyboard.

### 4.12 Platform
Finally, instances of Game, LevelManager, along with StartScreen are created in Platform. This is the starting point when launching the game.


## 5. Implementation (15% ~750 words)

The implementation of our 2D two-player platformer game was primarily carried out using the Processing programming language. In this section, we will highlight three main challenges we encountered in the development process.

### 5.1 Game Architecture
The architecture of the game was designed to be modular, maintainable and scalable, with a focus on separation of concerns and efficient use of resources. To achieve this, we design classes for updating game loop and managing the overal logic and state change. The Platform is the entry of our game where the setup() and draw() functions are implemented as shown in the following flowchart. 

![Platformer](./Demo/flowchart/Platformer.png)

The Game and LevelManager class are called here to initiate our game logic. Implementing the game loop was the first challenge we encountered, and to improve the game’s performance, we implemented our game loop based on the “Delta Time” method. In this type of game loop, the game loop measures the time elapsed since the last frame and uses that time to calculate how much the game state should be updated. Meanwhile, we created a new thread specifically for running the update logic of the game by making the Game class implement the Runnable interface, thus separating the value update logic from the rendering logic, as shown in the following flowchart. 

![Game](./Demo/flowchart/Game.png)

The LevelManager class manages the game state and difficulty switching, with its implementation details shown in the figure below.

![LevelManager](./Demo/flowchart/LevelManager.png)

### 5.2 Level Design
We employed a manual level design process using text files to represent the map layout and game objects. 

We designed a custom format for representing the game’s levels using plain text files. Each character in the text file corresponded to a specific tile or game object, with a defined characters set representing the level layout. For example, we used the following characters: 
- ‘ ’: empty space
- ‘#’: wall
- ‘S’: players’ starting points
- ‘I’: ice rivers
- ‘P’: poison
- ‘F’: lava
- ‘D’: diamonds
- etc.

Using the text-based format, we manually designed levels by creating text files with the desired layout of tiles and game objects. This approach allowed us to easily iterate on level designs and share them among team members for testing and feedback.

We implemented a custom level parser function in our game to read the text files and instantiate the corresponding game objects in the game. The parser looped through each character in the text file, creating the appropriate game object based on the character’s representation, and placed it at the corresponding position in the game world’s grid. This process allowed us to efficiently generate levels from the text files during runtime.

The visual design of each level was brought to life using a third-party assets called [pirate-bomb](https://pixelfrog-assets.itch.io/pirate-bomb).


### 5.3 Collision Detection
It is essential for our project to have an accurate and efficient collision detection mechanism. The third challenge we faced during the implementation is collision detection. To solve this problem, we implemented a collision detection method that is based on checking the rectangle borders of the game objects, which proved to be effective in our game. 

We first created the Collider class which is used for representing the rectangle borders of game objects. This class also contains the method of checking if two rectangles are collided. The core method of the Collider class is the collideWith() method, which takes in another Collider instance as an argument and checks if the collision has happened. To improve the performance of our game, we are only checking the key points of objects, including the four corners and four midpoints.

In the Character class, we implemented the main logic for calling collision detection. When the characters move, the collision of the X-axis and Y-axis will be checked, which is achieved by calling the moveX() and moveY() methods. Both methods check if the characters will collide with other game objects in their next position. If the collision is detected in either axis, the movement on this axis will be cancelled. 

The following diagram shows an overview of the collision detection architecture where the relationship of the classes is shown. 

<img style="display: block; margin: auto" src="./Demo/flowchart/CollidersOverview.png" alt="CollidersOverview" width="400">

The following diagrams are the class diagram for the Character class and Collider class. 

<img src="./Demo/flowchart/CharacterClassDiagram.png" alt="CharacterClassDiagram" width="400">
<img src="./Demo/flowchart/ColliderClassDiagram.png" alt="ColliderClassDiagram" width="200">

The following diagram is the flowchart for collision detection which demonstrates the steps for detection in details.

<img style="display: block; margin: auto" src="/Demo/flowchart/CollisionDetectionFlowchart.png" alt="CollisionDetectionFlowchart" width="500">

## 6. Evaluation

### 6.1 HCL Evaluation
After developing a functional prototype for our game, we conducted an evaluation to pinpoint any potential usability issues. For our initial assessment, we chose to conduct a Heuristic Evaluation as it provides immediate feedback and allows for a more comprehensive analysis compared to a Think-Aloud Evaluation.

We chose 3 people to be our evaluators and coached them into experts by elaborating on the game's design and allowing them to look through our code. Our experts then went through the interface twice, the first time to get a feel for the system and the second time to focus on different elements & explore the game further. After the evaluator was satisfied with the time spent on the interface, we asked them to fill in a [form](https://github.com/UoB-COMSM0110/2023-group-12/tree/master/Evaluation/Heuristic/BlankForm.md) providing us with a list of possible usability problems, the usability principle and the design feature that violated it. All three forms can be found [here](https://github.com/UoB-COMSM0110/2023-group-12/tree/master/Evaluation/Heuristic/Forms).

As each expert only provided a small number of usability problems, we waited until after the session to send out a complete list of usability problems and asked the experts to rate them based on their severity. As you can see from the [severity scores](https://github.com/UoB-COMSM0110/2023-group-12/tree/master/Evaluation/Heuristic/SeverityScores.md), our usability problems in order of most significant to least are:

- The game glitched after releasing too many bullets
- Cannot press W&A at the same time
- How to complete a level is not clear
- Had to figure out which keys to use to move the players & shoot
- Keys are different to standard gaming conventions
- Can not distinguish between player and enemies
- Forgetting which keys to use when switching between players

Our main problem with the game was the frequent glitches, which significantly impacted the overall user experience. We received a suggestion from one of our experts, who recommended deleting bullets after they left the screen to address this issue. However, despite implementing this approach, we were still experiencing problems. After conducting further research, we decided to utilise object pooling as a solution. Object pooling involves reusing existing bullets instead of creating new ones each time the player fires. By implementing this technique, we were able to save memory and prevent the game from glitching, which greatly improved its overall performance.

Also, our experts pointed out that the keys and objectives of the game are unclear, so we have taken steps to address this issue. Firstly, we have added a start page that provides instructions on how to play the game. Additionally, we have included the aim of each level at the top of the screen to help players understand what they need to do to progress. Lastly, we have made it easier for players to restart by providing instructions on how to do so at the top of each level, preventing them from becoming stuck in the game. These improvements should help enhance the overall gameplay experience for our users.

### 6.2 Quantitative Evaluation
For our quantitative evaluation, we decided to conduct a system usability survey (SUS) as it can be used on small sample sizes and produces reliable results. We asked 5 people to play our game and then fill out the [survey](https://github.com/UoB-COMSM0110/2023-group-12/blob/master/Evaluation/SUS/Survey.md). We then calculated the scores from each user and got the following results:

| Player | Easiest Level | More Difficult Level |
| --- | --- | --- |
| 1 | 77.5 | 87.5 |
| 2 | 80 | 75 |
| 3 | 72.5 | 82.5 |
| 4 | 72.5 | 70 |
| 5 | 77.5 | 77 |

(click [here](https://github.com/UoB-COMSM0110/2023-group-12/blob/master/Evaluation/SUS/Results.md) to see the full results)

Using these results, we decided to perform a Wilcoxon signed-rank test to conclude whether or not there is a significant difference between the two levels of difficulty. To do this, we first need to calculate the differences between the scores of the two levels for each player. We then ranked the differences by absolute value and assigned signs to them based on the direction of the difference. Finally, we calculated the test statistic and compared it to the critical value to determine if there is a significant difference between the two levels.

| Player | Easiest Level | More Difficult Level | Difference |
| --- | --- | --- | --- |
| 1 | 77.5 | 87.5 | 10 |
| 2 | 80 | 75 | -5 |
| 3 | 72.5 | 82.5 | 10 |
| 4 | 72.5 | 70 | -2.5 |
| 5 | 77.5 | 77 | -0.5 |

Ranked differences:

| Player | Difference | Absolute Rank | Sign |
| --- | --- | --- | --- |
| 1 | 10 | 4.5 | + |
| 2 | -5 | 2 | - |
| 3 | 10 | 4.5 | + |
| 4 | -2.5 | 1.5 | - |
| 5 | -0.5 | 1 | - |

(We assign a rank of 4.5 to the tied ranks of 4 and 5, and a rank of 1.5 to the 1 and 2 tie)

We summed the ranks with positive and negative signs and got the values 9 and 4.5 respectively. With 4.5 being the smaller of these two values, we set our test statistic to be T=4.5.

To determine if this result is significant, we compared it to the critical value for a two-tailed test with n = 5 observations. With alpha=0.05, we get a critical value of 2. Hence, we find that T = 4.5 falls within the significant range. Therefore, we can reject the null hypothesis that there is no difference between the two levels of difficulty, and conclude that there is a significant difference between the two levels.

These results tell us that the performance of individuals at the easier level is significantly different from the performance at the more difficult level. This difference could indicate that one level is more challenging or demanding than the other, or that one level is easier and less demanding than the other - which is the desired conclusion. 

Although the two evaluations above contained black-box testing, we decided to do some more of our own. To thoroughly test our game, we played through all possible paths and scenarios. By doing so, we were able to identify and address any other issues, bugs or complications that may have arisen. This allowed us to ensure that our game is fully functional and provides an enjoyable user experience.

## 7. Process (15% ~750 words)

### 7.1 Development Process
At first, we held several brainstorming sessions to decide the game and the twist we were going to implement. We found it useful since everyone can express their thoughts and a bunch of great ideas were generated. Also, we could handle conflicts promptly and negotiate to get a suitable solution. After these sessions, we reached an agreement on the goals and outline of the game.

We chose the agile methodology to manage our project since it was hard to get a specification at the beginning. Scrum is a widely used methodology in agile development. Due to the lack of time to follow a daily schedule, we decided to divide the development process into some small parts. At the end of every sprint, we got an executable game with some functions expected to be implemented in that version. For instance, in the first version, we’ve only got a game with one level and one controllable cube without weapons and enemies. Gradually, other elements like river, diamond and other maps were added to our game. Some main versions are listed below.

| Version | Version 1 | Version 2 | Version 3 | Version 4 |
| :----: | :----: | :----: | :----:| :----: |
| **Functions** |one level<br>one cube<br>one cube | one level<br>one player<br>enemies not aggressive | one level<br>one player<br>enemies and weapons | multi-level<br>two-player<br>enemies and weapons |

Another tool we used in agile development was Kanban. In the stage of sprint planning, we would have some offline meetings. Most of them were held in the form of brainstorming. Every member introduced the work they’d done then and discussed the features to be implemented later. After a meeting, we categorized backlog by to-do and in-progress, and recorded other tasks as done using sticky notes.

We valued communication. Apart from offline meetings, we communicated through WhatsApp, from which we can message a certain person or the whole team instantly. When some glitches were found or the game was updated, our members can give a response immediately. Using this online instant messaging app has greatly improved communication efficiency. 

The tool that we used most was GitHub. And it turned out that it made our collaboration much more efficient. There are five branches for every member personally, a develop branch for merging and a main branch for the final version of the game. Every time someone tried to modify or add some features, they must pull the develop branch, which contained the newest version. When it comes to pushing, we merged our branch into develop branch and updated the two branches together. Flowchart of the branch management procedure is as follows.

<img src="./Demo/gitflowchart.jpg" alt="gitflowchart" width="800" height="400">

### 7.2 Team Roles
We assigned a specific role to every member according to their preference and strength. Although members took charge of different parts, we shared thoughts regularly and always considered the availability and comprehensibility of APIs in separate sections. The table below summarizes the role of each person.

Yuewen was in charge of the requirement section and the implementation of maps at every difficulty level. Specifically, she designed three new maps and then added elements like lava, diamonds, and buttons.

Zongjian took the responsibility of designing and coding the whole system structure and finished the design section. He drew the UML class diagram and specified the function of each class, which made our development process clearer and easier. Also, the significant part – the twist of adding enemies and weapons was implemented by him.

Shuxing was responsible for the implementation section and the implementation of multithreading. His work has resulted in smoother animations and controls throughout the game. Also, he helped fix some glitches in bullet reusing, which increased the robustness of the system.

Francesca was responsible for the evaluation section and the implementation of the level Manager. She also designed our game's opening animation and victory scene, contributing to improving the user experience.

Siru was responsible for the process section and the implementation of multiple players, which is based on Zongjian’s work. She helped to implement the control of the second player. 

### 7.3 Reflection
Overall, we worked together well. Agile development allows us more flexibility especially when we don’t have a specific plan. We can also continuously improve and change features when we get feedback from evaluators or when we come up with better ideas. Also, the assignment of roles and use of GitHub encourage the increase in productivity since every member has clear accountability. We can easily identify issues and complete every required task.

However, there are still some areas that we could improve in the development process. One of them is equal contribution. Because of the imbalanced workload in different areas, some members make more efforts on specific features. Although it’s hard to distribute work in a completely fair way, we should adjust everyone’s workload during the process of development.

Another critical challenge is efficient communication. For obvious reasons, it’s easy to record Kanban using sticky notes. But if we chose to use some online tools like Jira, the recording of tasks would be much more professional and not error-prone. Also, using online meeting software like Zoom instead of texting message can help to enhance the effiency of communication. 

## 8. Conclusion (10% ~500 words)

### 8.1 Reflection on whole project
This was the first time we developed a project from 0 to 1 on our own. In developing the game, we were guided by Lab, and by using the Software Engineer tools and skills we learned in the lecture, we achieved our goal of developing a brand new game through great teamwork.
Throughout the development of the project, our understanding and skills of Software Engineer were well-practiced and enhanced.
During the lecture, we learned about the various development processes, including how to analyse requirements, diagram tools that can be used when designing a program, testing methods, evaluation methods, and how to properly measure a project, etc.
By discussing the game prototype, confirming the game, confirming the twist part, and developing the whole game in Processing, we have acquired the ability to learn a new programming language by ourselves and have acquired and mastered the basic development skills of 2D games, as well as learning how to identify and analyse requirements.
By following the Software Engineer's scientific development approach, our project development process has become more efficient. The tools and diagrams introduced in the lecture have all been utilized and integrated into our project development, which has helped us a lot in our development. 
Through each of our scrum meetings and the use of other communication tools such as GitHub, our communication skills in software development have also been improved, and we have become more cooperative and aware of the points that we need to focus on in the Software Engineer development.

### 8.2 Reflection on Challenges
In the process of solving challenges, we have improved our technical skills: our ability to learn by ourselves, our programming skills enhancement, and our ability to find and use resources for solving problems. To improve efficiency, we use multiple diagrams to analyze the problems we are currently encountering and break them down, to divide up the work or find the key to the problem.

### 8.3 Future Work
Our game has currently met the requirements of this course. However, if we have the time and energy, we would continue to refine it and make it excellent, through the following aspects:
- Developing more levels and maps.
- Develop more tiles to interact with.
- Add a health bar.
- Randomly generate enemies.
- Rescue ally.
- Increase a Tilemap editor.

I believe we will still utilize all the Software Engineer skills and tools introduced in the lecture to ensure an efficient development process, including the Scrum, Kanban, GitHub, UML diagram, class diagram, etc. that we have adopted, and use appropriate testing methods for the project, with attention to project management and measuring our processes throughout, without breaking any Software Law, and at the end, the game needs to be evaluated and further improved by selecting the appropriate HCI Evaluation methods. And consciously try out more efficient and scientific tools and methods beyond the scope of the course, to choose something more suitable for the team in the context of the project.

## 9. Individual contribution

| Member Name | Team Role | Contribution |
| :------: | :-------: | :-----: |
| Yuewen Wang | Requirement Section<br>Level Design | 1.00 |
| Zongjian Wang | Design Section<br>System Structure<br>Enemies and Weapons | 1.00 |
| Shuxing Li | Implementation Section<br>Game Loop<br>Multi-thread | 1.00 |
| Francesca Heyworth | Evaluation Section<br>Level Manager | 1.00 |
| Siru Zhang | Process Section<br>Multiple Players | 1.00 |


