# Pokedex App

Hello there! Welcome to my first ever flutter app (the name is self-explaining). 

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

## What did it do?

The app actually shows you 3 main informations:

  ### The pokemon species
  
  The first section shows you lists with all the 898 registered pokemon, separated by generation. Clicking on the pokemon name, you'll go to a screen with Pokemon info:
    
  - Name;
  - Type(s);
  - Base stats;
  - Image and sprites in-game;
  - A random description from any pokedex that this pokemon appears;
  - List with this pokemon's moves and abilities;
  
  The text colors in pokemon details are associated to the pokemon main type (except the secondary type, if it exists, which have your color associated to itself). You can see this association [here](#type-colors). You can also click on any type, move or ability and go to its respective screen.
 
  <br />
  <img src="readme_gifs/Pokemon.gif" width="250" />
  
  ### The pokemon types
  
  <br />
  <img src="/readme_gifs/Types.gif" width="250" />
  
  ### The pokemon abilities

  <br />
  <img src="/readme_gifs/Abilities.gif" width="250" />

## Type colors

Each pokemon type have its representative color. These colors are:

  '''bash
  Normal: #A8A878,<br/>
  Fighting: #C03028,<br/>
  Flying: #B3B3FF,<br/>
  Poison: #A040A0,<br/>
  Ground: #E0C068,<br/>
  Rock: #B8A038,<br/>
  Bug: #A8B820,<br/>
  Ghost: #705898,<br/>
  Steel: #C0C0C0,<br/>
  Fire: #F08030,<br/>
  Water: #6890F0,<br/>
  Grass: #78C850,<br/>
  Electric: #F8D030,<br/>
  Psychic: #F85888,<br/>
  Ise: #98D8D8,<br/>
  Dragon: #7038F8,<br/>
  Dark: #3E223A,<br/>
  Fairy: #EE99AC
  '''

## Generation colors
  
For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
