require_relative '../models/address_book'

RSpec.describe AddressBook do
  let(:book) { AddressBook.new }

  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eq expected_name
    expect(entry.phone_number).to eq expected_number
    expect(entry.email).to eq expected_email
  end

  describe "attributes" do
    it "responds to entries" do
      expect(book).to respond_to(:entries)
    end

    it "initializes entries as an array" do
      expect(book.entries).to be_an(Array)
    end

    it "initializes entries as empty" do
      expect(book.entries.size).to eq(0)
    end
  end

  describe "#add_entry" do
    it "adds only one entry to the address book" do
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

      expect(book.entries.size).to eq(1)
    end

    it "adds the correct information to entries" do
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq('010.012.1815')
      expect(new_entry.email).to eq('augusta.king@lovelace.com')
    end
  end

  describe "#import_from_csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries.csv")
      book_size = book.entries.size
      expect(book_size).to eq 5
    end

    it "imports the 1st entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[0]
      check_entry(entry_one, "Bill", "555-555-5511", "billme@mail.com")
    end

    it "imports the 2nd entry" do
      book.import_from_csv("entries.csv")
      entry_two = book.entries[1]
      check_entry(entry_two, "Caine", "456-654-7894", "caineis@fresh.com")
    end

    it "imports the 3rd entry" do
      book.import_from_csv("entries.csv")
      entry_three = book.entries[2]
      check_entry(entry_three, "Dwayne", "123-456-7890", "dwayneisa@rock.com")
    end

    it "it imports the 4th entry" do
      book.import_from_csv("entries.csv")
      entry_four = book.entries[3]
      check_entry(entry_four, "Frodo", "777-777-4564", "frodoisa@hobbit.com")
    end

    it "it imports the 5th entry" do
      book.import_from_csv("entries.csv")
      entry_five = book.entries[4]
      check_entry(entry_five, "Gandalf", "111-222-3344", "ima@wizard.com")
    end
  end

  #test the binary_search method
  describe "#binary_search" do
    it "searches AddressBook for a non-existent entry" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Dan")
      expect(entry).to be_nil
    end

    it "searches AddressBook for Bill" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Bill")
      expect(entry).to be_a Entry
      check_entry(entry, "Bill", "555-555-5511", "billme@mail.com")
    end

    it "searches AddressBook for Caine" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Caine")
      expect(entry).to be_a Entry
      check_entry(entry, "Caine", "456-654-7894", "caineis@fresh.com")
    end

    it "searches AddressBook for Dwayne" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Dwayne")
      expect(entry).to be_a Entry
      check_entry(entry, "Dwayne", "123-456-7890", "dwayneisa@rock.com")
    end

    it "searches AddressBook for Frodo" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Frodo")
      expect(entry).to be_a Entry
      check_entry(entry, "Frodo", "777-777-4564", "frodoisa@hobbit.com")
    end

    it "searches AddressBook for Gandalf" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Gandalf")
      expect(entry).to be_a Entry
      check_entry(entry, "Gandalf", "111-222-3344", "ima@wizard.com")
    end

    it "searches AddressBook for Billy" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Billy")
      expect(entry).to be_nil
    end
  end
end
