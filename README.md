🍩 Donut Shop

A simple Ruby application built using OOP and MVC architecture.

What does it do?

List available donuts

Add new donuts

Delete donuts

Sell donuts and update stock

Save donut information in a CSV file

How the Files Connect

File

Responsibility

app.rb

Creates and connects the objects

router.rb

Handles the user's menu choices

donuts_controller.rb

Connects the View, Model, and Repository

donuts_view.rb

Asks questions and displays information

donut_repository.rb

Stores donuts and saves them to CSV

donut.rb

Defines one donut and its behavior

donuts.csv

Keeps saved donut information

How to Run

Make sure Ruby is installed, then run:

ruby app.rb

How It Works

app.rb starts the application.

The Router displays the menu.

The Controller handles the selected action.

The View collects input or displays results.

The Model represents a donut.

The Repository manages donuts and saves their information to CSV.

Technologies

Ruby

Object-Oriented Programming (OOP)

Model–View–Controller (MVC)

CSV for data storage

Purpose

A learning project to practice Ruby classes, objects, methods, MVC architecture, and connecting multiple files together.
