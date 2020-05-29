require 'pry'
class BankAccount
    attr_reader :name
    attr_accessor :status, :balance

    @@all = []

    def initialize(name)
        @name = name
        @status = "open"
        @balance = 1000
        save
    end

    def save
        self.class.all << self
    end

    def deposit(money)
        self.balance += money
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        # binding.pry
        self.status == "open" && self.balance > 0
    end

    def close_account
        self.status = "closed"
    end

    def self.all
        @@all
    end
end
