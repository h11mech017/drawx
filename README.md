# DrawX

DrawX is a Flutter application that allows users to create a custom live chart with options and their associated probabilities. Users can add, edit, or remove options, and view the results of their spins.

## Features

- Add options with their probabilities
- Edit options and probabilities
- Remove options
- Spin the live chart
- View results of spins

## Installation

1. Ensure that you have [Flutter](https://flutter.dev/docs/get-started/install) and the [Dart SDK](https://dart.dev/get-dart) installed on your machine.

2. Clone the repository:

    ```sh
    git clone https://github.com/yourusername/DrawX.git
    ```

3. Move into the project directory:
    
    ```sh
   cd DrawX
   ```
4. Install the dependencies:
        
    ```sh
    flutter pub get
    ```
5. Run the app on an emulator or a connected device:
        
    ```sh
    flutter run
    ```

## Project Detail
Project Name: **DrawX**  
Graphical Abstract  
app icon:   
<img src="https://github.com/h11mech017/drawx/blob/main/image/mmexport1682416082853.png" width="200">      
Purpose of the Software

### Type of Software Development Process
We have chosen the **Agile software development process** for this project.

### Reason for Choosing Agile
We chose Agile over Waterfall due to its iterative and flexible approach, allowing us to adapt to changes and deliver working software more quickly. Agile promotes collaboration and continuous improvement, making it suitable for our project.

### Possible Usage of the Software
This Windows-based Flutter application can be used for cross-platform app development, targeting users who require a versatile solution for both mobile and desktop platforms.

### Software Development Plan 
Development Process:
1. Requirements gathering and analysis
2. Design and architecture
3. Implementation and coding
4. Testing and validation
5. Deployment and maintenance

### Schedule
1. Requirements gathering and analysis (Week 1-2)
2. Design and architecture (Week 3-4)
3. Implementation and coding (Week 5-10)
4. Testing and validation (Week 11-12)
5. Deployment and maintenance (Week 13 onwards)

### Algorithm
Given a list of prizes and a corresponding list of probabilities, where the sum of probabilities equals 1.  
When the user clicks the spin button, a random number is generated within the range of [0, 1).  
The cumulative probabilities for each prize are calculated based on the probability list. The random number is then compared with the cumulative probabilities to determine the winning prize.  
The rotation angle is calculated to stop at the winning prize.  
The roulette wheel is rotated, and the winning prize is returned to the user after the rotation stops.  
In summary, the algorithm of this app relies on probabilities and random numbers to determine the winning prize by computing the probability distribution and simulating the randomness of the rotation.  

### Future Plan
1. Implement additional features based on user feedback.
2. Optimize the codebase for better performance.
3. Ensure compatibility with future Flutter and Windows updates.

### Additional Components in README.md
1. Demo YouTube URL
    * Environments of the software development and running
    * Programming language: C++, Dart
    * Minimum H/W requirements: [Specify minimum hardware requirements]
    * Minimum S/W requirements: Windows 10, Flutter SDK
    * Required packages: flutter_windows
    * Declaration
    * Open-source packages used: Flutter SDK, Windows API

## Contributors

This project was developed in collaboration with the following group members:

- Leo
- Echo
- Kindson
- Shine
- Paris

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
