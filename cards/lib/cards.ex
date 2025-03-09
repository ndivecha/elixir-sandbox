defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Hello world.

  """
  def hello do
    "Hello world! hi there!"
  end

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five",
    "Six", "Seven", "Eight", "Nine", "Ten",
    "King", "Queen", "Joker"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # Solution 1
    # Using List flatten
    # cards = for value <- values do
    #   for suit <- suits do
    #     "#{value} of #{suit}"
    #   end
    # end

    # List.flatten(cards)

    # Solution 2
    # Double the comprehensions
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
  Shuffle function to shuffle card deck and returns new list
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Asking a question(?) returns True or False
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Takes two argument and returns new list
  deck of card
  deal number - how many cards you want
  Using Enum.split()
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end
end
