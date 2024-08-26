# Space News App

## Overview

The **Space News App** is a mobile application developed using Flutter, which aggregates and displays the latest space-related news articles. The app leverages the Spaceflight News API to fetch articles and uses the GetX package for state management, dependency injection, and routing. Users can view the latest news, save articles to their favorites, and read detailed news on a separate screen.

## Features

- **Home Screen:** Displays the latest space news in a visually appealing card layout. Users can scroll through the articles and mark them as favorites.
- **Article Details Screen:** Shows the full details of a selected news article, including the title, image, and summary.
- **Favorites Screen:** Lists all articles that have been marked as favorites by the user.

## Tech Stack

- **Flutter:** The app is built using Flutter, a UI toolkit for crafting natively compiled applications for mobile.
- **GetX:** For state management, dependency injection, and routing.
- **Spaceflight News API:** The source of all news articles displayed in the app.

## Screens

1. **Home Screen**
   - Lists articles fetched from the Spaceflight News API.
   - Displays each article with an image, title, summary, and published date.
   - Allows users to mark articles as favorites.

2. **Article Details Screen**
   - Provides detailed information about a selected article.
   - Shows the title, image, summary, and published date.

3. **Favorites Screen**
   - Displays all the articles marked as favorites by the user.
   - Users can access this screen via the bottom navigation bar.






