defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  Provides methods for creating and handling a deck of cards.
  """

  @doc """
  Hello world.
  This is how we start learning Elixir.

  """
  def hello do
    "Hello world! hi there!"
  end

  @doc """
  Function to create deck of cards.
  """
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


  @doc """
  To save the deck of cards to file
  Here we use erlang by passing the deck and filename to store binary object.
  deck = Cards.create_deck()
  Cards.save(deck, "my_deck")
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  To open the file
  :ok means atom - they are strings
  :error
  _reason - we understand but we dont want to use it.
  """
  def load(filename) do

    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File not found!"
    end

  end

  @doc """
  Function which creates the deck, shuffles, and deals it.
  Using Pipe operator |>
  """
  def create_hand(hand_size) do
    # deck = Cards.create_deck()
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck, hand_size)

    # Using Pipe operator |> requires consistent first argument.
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)

  end

end
