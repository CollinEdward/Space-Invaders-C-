#include <SFML/Graphics.hpp>
#include <SFML/Audio.hpp>

#include <time.h>
#include <stdlib.h>
#include <iostream>

int main() {
    srand(time(NULL));
    int points = 0;

    sf::RenderWindow window(sf::VideoMode(1280, 720), "Space Invaders");

    sf::Texture ship_texture;
    if (!ship_texture.loadFromFile("/Users/mbn/Documents/Programmering/Cpp Game/assets/images/space-ship.png")) {
        std::cout << "Error loading image" << std::endl;
        return 1;
    }

    sf::Texture enemy_texture;
    if (!enemy_texture.loadFromFile("/Users/mbn/Documents/Programmering/Cpp Game/assets/images/sur_em.jpg")) {
        std::cout << "Error loading image" << std::endl;
        return 1;
    }

    sf::Font font;
    if (!font.loadFromFile("/Users/mbn/Documents/Programmering/Cpp Game/assets/fonts/arial.ttf")) {
        std::cout << "Error loading font" << std::endl;
        return 1;
    }

    sf::RectangleShape stars;
    stars.setFillColor(sf::Color::White);
    stars.setSize(sf::Vector2f(1, 1));

    std::vector<sf::RectangleShape> starfield; // Create a vector to store stars

    for (int i = 0; i < 400; i++) {
        sf::RectangleShape star;
        star.setFillColor(sf::Color::White);
        star.setSize(sf::Vector2f(1, 1));
        star.setPosition(rand() % 1280, rand() % 720);
        starfield.push_back(star); // Add each star to the starfield vector
    }

    sf::Text Points;
    Points.setCharacterSize(24);
    Points.setPosition(10, 10);
    Points.setFillColor(sf::Color::White);
    Points.setFont(font);

    sf::RectangleShape ship;
    ship.setSize(sf::Vector2f(100, 100));
    ship.setTexture(&ship_texture);
    ship.setPosition(sf::Vector2f(640, 550));

    sf::RectangleShape bullet;
    bullet.setFillColor(sf::Color::Red);
    bullet.setSize(sf::Vector2f(10, 10));
    bool isBulletFired = false;

    std::vector<sf::RectangleShape> enemies;

    int num_enemies = rand() % 12 + 1;
    sf::RectangleShape enemy;
    for (int i = 0; i < num_enemies; i++) {
        enemy.setTexture(&enemy_texture);
        enemy.setPosition(rand() % 1000, 100);
        enemy.setSize(sf::Vector2f(50, 50));

        // Check if one of the enemies is inside another enemy
        if (i > 0) {
            for (int j = 0; j < i; j++) {
                if (enemies[j].getGlobalBounds().intersects(enemy.getGlobalBounds())) {
                    enemy.setPosition(enemy.getPosition().x + 100, enemy.getPosition().y);
                    j = 0;
                }
            }
        }

        // Give a random color to each enemy
        enemy.setFillColor(sf::Color(rand() % 256, rand() % 256, rand() % 256));
        enemies.push_back(enemy);
    }

    sf::SoundBuffer buffer;
    if (!buffer.loadFromFile("/Users/mbn/Documents/Programmering/Cpp Game/sounds/shoot.wav")) {
        std::cout << "Error loading sound" << std::endl;
        return 1;
    }

    sf::Sound sound;
    sound.setBuffer(buffer);

    while (window.isOpen()) {
        sf::Vector2i mousePosition = sf::Mouse::getPosition(window);
        sf::Event event;
        while (window.pollEvent(event)) {
            if (event.type == sf::Event::Closed) {
                window.close();
            }
        }

        if (sf::Keyboard::isKeyPressed(sf::Keyboard::W)) {
            ship.move(0, -0.2);
        } else if (sf::Keyboard::isKeyPressed(sf::Keyboard::S)) {
            ship.move(0, 0.2);
        } else if (sf::Keyboard::isKeyPressed(sf::Keyboard::A)) {
            ship.move(-0.2, 0);
        } else if (sf::Keyboard::isKeyPressed(sf::Keyboard::D)) {
            ship.move(0.2, 0);
        } else if (sf::Keyboard::isKeyPressed(sf::Keyboard::Space)) {
            if (!isBulletFired) {
                sound.play();
                bullet.setPosition((ship.getPosition().x + 45), ship.getPosition().y);
                isBulletFired = true;
            }
        }

        

        // Check if enemies are out of the screen
        bool isGameOver = false;
        for (int i = 0; i < enemies.size(); i++) {
            if (enemies[i].getPosition().y > window.getSize().y - 80) {
                isGameOver = true;
                break;
            }
        }

        
        if (isGameOver) {
            window.close();
        }

        if (isBulletFired) {
            bullet.move(0, -0.5);
            if (bullet.getPosition().y < 0) {
                isBulletFired = false;
            }
        }

        for (auto it = enemies.begin(); it != enemies.end(); ++it) {
            if (bullet.getGlobalBounds().intersects(it->getGlobalBounds())) {
                it = enemies.erase(it);

                points++;
                Points.setString("Points: " + std::to_string(points));
                isBulletFired = false;

                if (enemies.empty()) {
                    window.close();
                }
                if (it == enemies.end()) break;
            }
        }

        
        int borderOffset = -60;
        sf::Vector2f shipPosition = ship.getPosition();

        if (shipPosition.x < borderOffset) {
            shipPosition.x = borderOffset;
        }
        if (shipPosition.y < borderOffset) {
            shipPosition.y = borderOffset;
        }
        if (shipPosition.x > 1240 - ship.getSize().x - borderOffset) {
            shipPosition.x = 1240 - ship.getSize().x - borderOffset;
        }
        if (shipPosition.y > 680 - ship.getSize().y - borderOffset) {
            shipPosition.y = 680 - ship.getSize().y - borderOffset;
        }

        ship.setPosition(shipPosition);

        window.clear();

        for (const sf::RectangleShape& star : starfield) {
            window.draw(star);
        }

        window.draw(ship);
        window.draw(Points);

        for (sf::RectangleShape& enemy : enemies) {
            enemy.move(0, 0.01);
        }

        for (sf::RectangleShape& enemy : enemies) {
            window.draw(enemy);
        }


        if (isBulletFired) {
            window.draw(bullet);
        }

        window.display();
    }

    return 0;
}
