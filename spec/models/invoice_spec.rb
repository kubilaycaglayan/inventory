require 'rails_helper'

RSpec.describe Invoice, type: :model do
  let(:invoice_number) { 0001 }
  let(:pen_number) { 010 }
  let(:quantity) { 1 }
  let(:tax_kdv) { 18.0 }
  let(:tax_otv) { 15.5 }
  let(:definition) { 'Refrigerator' }
  let(:value_date) { '2025-02-15' }
  let(:invoice_date) { '2025-02-15' }
  let(:sum) { 1550.50 }
  let(:product_code_updated_1) { 'product_code_updated_1' }
  let(:product_code_1) { 'product_1' }
  let(:product_code_2) { 'product_2' }
  let(:product_code_3) { 'product_3' }
  let(:product_code_unique_1) { 'product_unique_1' }
  let(:product_code_unique_2) { 'product_unique_2' }
  let(:product_code_unique_3) { 'product_unique_3' }

  let(:product_information) {{
    invoice_number: invoice_number,
    pen_number: pen_number,
    quantity: quantity,
    tax_kdv: tax_kdv,
    tax_otv: tax_otv,
    definition: definition,
    value_date: value_date,
    sum: sum,
    product_code: product_code_1,
    invoice_date: invoice_date
  }}

  let(:product_information_1) {{
    invoice_number: invoice_number,
    pen_number: pen_number,
    quantity: quantity,
    tax_kdv: tax_kdv,
    tax_otv: tax_otv,
    definition: definition,
    value_date: value_date,
    sum: sum,
    product_code: product_code_1,
    invoice_date: invoice_date
  }}

  let(:product_information_2) do
    information = product_information_1.clone
    information['product_code'] = product_code_2
    information['pen_number'] = product_information_1['pen_number'] + 1

    information
  end

  let(:product_information_2) do
    information = product_information_1.clone
    information['product_code'] = product_code_2
    information['pen_number'] = product_information_1['pen_number'] + 2

    information
  end

  let(:product_information_with_timestamps_1) do
    information = product_information_1.clone
    information['created_at'] = Time.now
    information['updated_at'] = Time.now

    information.as_json
  end

  let(:product_information_with_timestamps_2) do
    information = product_information_with_timestamps_1.clone
    information['product_code'] = product_code_2

    information
  end

  let(:product_information_with_timestamps_3) do
    information = product_information_with_timestamps_1.clone
    information['product_code'] = product_code_3

    information
  end

  let(:product_information_with_timestamps_unique_1) do
    information = product_information_with_timestamps_1.clone
    information['product_code'] = product_code_unique_1
    information['pen_number'] = 596

    information
  end

  let(:product_information_with_timestamps_unique_2) do
    information = product_information_with_timestamps_1.clone
    information['product_code'] = product_code_unique_2
    information['pen_number'] = 597

    information
  end

  let(:product_information_with_timestamps_unique_3) do
    information = product_information_with_timestamps_1.clone
    information['product_code'] = product_code_unique_3
    information['pen_number'] = 598

    information
  end

  let(:invoice1) { Invoice.new(product_information) }
  let(:invoice2) { Invoice.create({ invoice_date: '2020-10-1', invoice_number: 2, pen_number: 2, quantity: 2, tax_kdv: 2, tax_otv: 2, definition: definition, value_date: value_date, sum: 2, product_code: product_code_unique_1 }) }
  let(:invoice12) { Invoice.create({ invoice_date: '2020-10-1', invoice_number: 12, pen_number: 2, quantity: 2, tax_kdv: 2, tax_otv: 2, definition: definition, value_date: value_date, sum: 2, product_code: product_code_unique_2 }) }
  let(:invoice3) { Invoice.create({ invoice_date: '2020-10-2', invoice_number: 3, pen_number: 3, quantity: 3, tax_kdv: 3, tax_otv: 3, definition: definition, value_date: value_date, sum: 3, product_code: product_code_unique_1 }) }
  let(:invoice13) { Invoice.create({ invoice_date: '2020-10-2', invoice_number: 13, pen_number: 3, quantity: 3, tax_kdv: 3, tax_otv: 3, definition: definition, value_date: value_date, sum: 3, product_code: product_code_unique_2 }) }
  let(:invoice4) { Invoice.create({ invoice_date: '2020-10-3', invoice_number: 4, pen_number: 4, quantity: 4, tax_kdv: 4, tax_otv: 4, definition: definition, value_date: value_date, sum: 4, product_code: product_code_unique_1 }) }
  let(:invoice14) { Invoice.create({ invoice_date: '2020-10-3', invoice_number: 14, pen_number: 4, quantity: 4, tax_kdv: 4, tax_otv: 4, definition: definition, value_date: value_date, sum: 4, product_code: product_code_unique_2 }) }
  let(:invoice5) { Invoice.create({ invoice_date: '2020-10-4', invoice_number: 5, pen_number: 5, quantity: 5, tax_kdv: 5, tax_otv: 5, definition: definition, value_date: value_date, sum: 5, product_code: product_code_unique_1 }) }
  let(:invoice15) { Invoice.create({ invoice_date: '2020-10-4', invoice_number: 15, pen_number: 5, quantity: 5, tax_kdv: 5, tax_otv: 5, definition: definition, value_date: value_date, sum: 5, product_code: product_code_unique_2 }) }
  let(:invoice6) { Invoice.create({ invoice_date: '2020-10-5', invoice_number: 6, pen_number: 6, quantity: 6, tax_kdv: 6, tax_otv: 6, definition: definition, value_date: value_date, sum: 6000, product_code: product_code_unique_1 }) }
  let(:invoice16) { Invoice.create({ invoice_date: '2020-10-5', invoice_number: 16, pen_number: 6, quantity: 6, tax_kdv: 6, tax_otv: 6, definition: definition, value_date: value_date, sum: 6000, product_code: product_code_unique_2 }) }
  let(:invoice7) { Invoice.create({ invoice_date: '2020-10-6', invoice_number: 7, pen_number: 7, quantity: 4, tax_kdv: 7, tax_otv: 7, definition: definition, value_date: value_date, sum: 7, product_code: product_code_unique_1 }) }
  let(:invoice17) { Invoice.create({ invoice_date: '2020-10-6', invoice_number: 17, pen_number: 7, quantity: 4, tax_kdv: 7, tax_otv: 7, definition: definition, value_date: value_date, sum: 7, product_code: product_code_unique_2 }) }
  let(:invoice8) { Invoice.create({ invoice_date: '2020-10-7', invoice_number: 8, pen_number: 8, quantity: 4, tax_kdv: 8, tax_otv: 8, definition: definition, value_date: value_date, sum: 400, product_code: product_code_unique_1 }) }
  let(:invoice18) { Invoice.create({ invoice_date: '2020-10-7', invoice_number: 18, pen_number: 8, quantity: 4, tax_kdv: 8, tax_otv: 8, definition: definition, value_date: value_date, sum: 400, product_code: product_code_unique_2 }) }
  let(:invoice9) { Invoice.create({ invoice_date: '2020-10-8', invoice_number: 9, pen_number: 9, quantity: 4, tax_kdv: 9, tax_otv: 9, definition: definition, value_date: value_date, sum: 500, product_code: product_code_unique_1 }) }
  let(:invoice19) { Invoice.create({ invoice_date: '2020-10-8', invoice_number: 19, pen_number: 9, quantity: 4, tax_kdv: 9, tax_otv: 9, definition: definition, value_date: value_date, sum: 500, product_code: product_code_unique_2 }) }

  let(:group1) do
    invoice2
    invoice12
    invoice3
    invoice13
    invoice4
    invoice14
    invoice5
    invoice15
    invoice6
    invoice16
    invoice7
    invoice17
    invoice8
    invoice18
    invoice9
    invoice19
  end

  describe 'database validations' do
    describe 'general' do
      it 'successfully creates and invoice record' do
        expect(invoice1.save).to be true
      end

      it 'successfully creates and invoice record' do
        expect(invoice1.save).not_to be false
      end
    end

    describe 'data types' do

      describe 'invoice_number' do
        it 'has an integer data type' do
          expect(invoice1.invoice_number).to be_an_instance_of Integer
        end

        it 'successfully stores the integer' do
          expect(invoice1.invoice_number).to be invoice_number
        end

        it 'has an integer data type - falsy' do
          expect(invoice1.invoice_number).not_to be_an_instance_of String
        end

        it 'successfully stores the integer - falsy' do
          expect(invoice1.invoice_number).not_to be invoice_number + 1
        end
      end

      describe 'pen_number' do
        it 'has an integer data type' do
          expect(invoice1.pen_number).to be_an_instance_of Integer
        end

        it 'successfully stores the integer' do
          expect(invoice1.pen_number).to be pen_number
        end

        it 'has an integer data type - falsy' do
          expect(invoice1.pen_number).not_to be_an_instance_of String
        end

        it 'successfully stores the integer - falsy' do
          expect(invoice1.pen_number).not_to be pen_number + 1
        end
      end

      describe 'quantity' do
        it 'has an integer data type' do
          expect(invoice1.quantity).to be_an_instance_of Integer
        end

        it 'successfully stores the integer' do
          expect(invoice1.quantity).to be quantity
        end

        it 'has an integer data type - falsy' do
          expect(invoice1.quantity).not_to be_an_instance_of String
        end

        it 'successfully stores the integer - falsy' do
          expect(invoice1.quantity).not_to be quantity + 1
        end
      end

      describe 'tax_kdv' do
        it 'has a Decimal(BigDecimal) data type' do
          expect(invoice1.tax_kdv).to be_an_instance_of BigDecimal
        end

        it 'successfully stores the integer' do
          expect(invoice1.tax_kdv).to eq tax_kdv
        end

        it 'has an Decimal(BigDecimal) data type - falsy' do
          expect(invoice1.tax_kdv).not_to be_an_instance_of Integer
        end

        it 'successfully stores the value - falsy' do
          expect(invoice1.tax_kdv).not_to be tax_kdv + 1
        end

        it 'can only store up to 5 digits' do
          inv = Invoice.new(tax_kdv: 12345.67)
          expect(inv.tax_kdv).to eq 12346
        end

        it 'can only store up to 2 decimals' do
          inv = Invoice.new(tax_kdv: 1.237)
          expect(inv.tax_kdv).to eq 1.24
        end
      end

      describe 'tax_otv' do
        it 'has a Decimal(BigDecimal) data type' do
          expect(invoice1.tax_otv).to be_an_instance_of BigDecimal
        end

        it 'successfully stores the integer' do
          expect(invoice1.tax_otv).to eq tax_otv
        end

        it 'has an Decimal(BigDecimal) data type - falsy' do
          expect(invoice1.tax_otv).not_to be_an_instance_of Integer
        end

        it 'successfully stores the value - falsy' do
          expect(invoice1.tax_otv).not_to be tax_otv + 1
        end
      end

      describe 'definition' do
        it 'has a String data type' do
          expect(invoice1.definition).to be_an_instance_of String
        end

        it 'successfully stores the integer' do
          expect(invoice1.definition).to eq definition
        end

        it 'has an String data type - falsy' do
          expect(invoice1.definition).not_to be_an_instance_of Integer
        end

        it 'successfully stores the value - falsy' do
          expect(invoice1.definition).not_to be definition + '1'
        end
      end

      describe 'value_date' do
        it 'has a Date data type' do
          expect(invoice1.value_date).to be_an_instance_of Date
        end

        it 'successfully stores the Date object' do
          expect(invoice1.value_date).to eq Date.parse(value_date)
        end

        it 'has an Date data type - falsy' do
          expect(invoice1.value_date).not_to be_an_instance_of String
        end

        it 'successfully stores the value - falsy' do
          expect(invoice1.value_date).not_to be Date.parse('2020-02-11')
        end
      end

      describe 'sum' do
        it 'has a Decimal(BigDecimal) data type' do
          expect(invoice1.sum).to be_an_instance_of BigDecimal
        end

        it 'successfully stores the integer' do
          expect(invoice1.sum).to eq sum
        end

        it 'has an Decimal(BigDecimal) data type - falsy' do
          expect(invoice1.sum).not_to be_an_instance_of Integer
        end

        it 'successfully stores the value - falsy' do
          expect(invoice1.sum).not_to be sum + 1
        end
      end

      describe 'product_code' do
        it 'has a String data type' do
          expect(invoice1.product_code).to be_an_instance_of String
        end

        it 'successfully stores the integer' do
          expect(invoice1.product_code).to eq product_code_1
        end

        it 'has an String data type - falsy' do
          expect(invoice1.product_code).not_to be_an_instance_of Integer
        end

        it 'successfully stores the value - falsy' do
          expect(invoice1.product_code).not_to be product_code_1 + '1'
        end
      end
    end

    describe 'has unique index on invoice_number:pen_number' do
      it 'does not save unique records' do
        invoice2 = invoice1.dup
        expect(invoice1.save!).to be true
        expect { invoice2.save! }.to raise_error ActiveRecord::RecordNotUnique
        invoice2.pen_number = rand.ceil
        expect(invoice2.save).to be true
      end
    end
  end

  describe 'insert operations' do
    it 'inserts a record with .insert method' do
      result = Invoice.insert(product_information_with_timestamps_1)

      expect(result.rows.first.size).to be 1
      expect(result.rows.first.first).to be_an_instance_of Integer
    end

    it 'inserts multiple records' do
      Invoice.insert_all([
        product_information_with_timestamps_unique_1,
        product_information_with_timestamps_unique_2,
        product_information_with_timestamps_unique_3
      ], returning: %w[ product_code definition ])

      expect(Set.new Invoice.pluck(:product_code)).to eq Set.new [
        product_code_unique_1,
        product_code_unique_2,
        product_code_unique_3
      ]

      expect(Set.new Invoice.pluck(:product_code)).not_to eq Set.new [
        product_code_unique_1,
        product_code_unique_2
      ]
    end

    it 'skips the non uniques and inserts valid records with .insert_all' do
      Invoice.insert_all([
        product_information_with_timestamps_1,
        product_information_with_timestamps_2,
        product_information_with_timestamps_3,
        product_information_with_timestamps_unique_1,
        product_information_with_timestamps_unique_2,
        product_information_with_timestamps_unique_3
      ])

      expect(Set.new Invoice.pluck('product_code')).to eq Set.new [
        product_information_with_timestamps_1['product_code'],
        product_information_with_timestamps_unique_1['product_code'],
        product_information_with_timestamps_unique_2['product_code'],
        product_information_with_timestamps_unique_3['product_code']
      ]
    end
  end

  describe 'upsert operations' do
    it 'updates a record with .upsert method' do
      record = Invoice.create(product_information)

      product_information_with_timestamps_2['id'] = record.id

      result = Invoice.upsert(product_information_with_timestamps_2)
      expect(Invoice.find(record['id']).product_code).to eq product_code_2
    end

    it 'both updates and inserts records with .upsert method' do
      record = Invoice.create(product_information) # initial record

      product_information_with_timestamps_2['id'] = record.id # update initial with this record

      product_information_with_timestamps_3['id'] = record.id + 1 # insert a new record
      product_information_with_timestamps_3['pen_number'] = 123

      Invoice.upsert_all([product_information_with_timestamps_2, product_information_with_timestamps_3])

      expect(Invoice.pluck(:product_code).first).to eq product_code_2
      expect(Invoice.pluck(:product_code).last).to eq product_code_3
    end
  end

  describe :'callbacks & triggers' do
    describe 'check_new_product' do
      it 'automatically adds new products after create' do
        expect(Product.count).to be 0
        Invoice.create(product_information)
        expect(Product.first.code).to eq product_code_1
      end

      it 'automatically adds new products after save' do
        expect(Product.count).to be 0
        Invoice.new(product_information).save
        expect(Product.first.code).to eq product_code_1
      end

      it 'do nothing if it already exists' do
        Product.create({code: product_code_1})
        expect(Product.count).to be 1
        Invoice.create(product_information)
        expect(Product.count).to be 1
        expect(Product.first.code).to eq product_code_1
      end

      it 'bulk operations: insert_all, 1 exists, insert 2' do
        Product.create({code: product_code_unique_1})
        expect(Product.count).to be 1
        Invoice.insert_all([
          product_information_with_timestamps_unique_1,
          product_information_with_timestamps_unique_2,
          product_information_with_timestamps_unique_3
        ],
        returning: %w[ product_code definition ]
      )
        expect(Product.count).to be 3
        expect(Set.new Product.pluck(:code)).to eq Set.new [
          product_code_unique_1,
          product_code_unique_2,
          product_code_unique_3,
        ]
      end

      it 'bulk operations: insert_all, all exists' do
        Product.create({code: product_code_unique_1})
        Product.create({code: product_code_unique_2})
        Product.create({code: product_code_unique_3})
        expect(Product.count).to be 3
        Invoice.insert_all([
          product_information_with_timestamps_unique_1,
          product_information_with_timestamps_unique_2,
          product_information_with_timestamps_unique_3
        ],
        returning: %w[ product_code definition ]
      )
        expect(Product.count).to be 3
        expect(Set.new Product.pluck(:code)).to eq Set.new [
          product_code_unique_1,
          product_code_unique_2,
          product_code_unique_3,
        ]
      end

      it 'bulk operations: insert_all, none exists, insert 3' do
        expect(Product.count).to be 0
        Invoice.insert_all([
          product_information_with_timestamps_unique_1,
          product_information_with_timestamps_unique_2,
          product_information_with_timestamps_unique_3
        ],
        returning: %w[ product_code definition ]
      )
        expect(Product.count).to be 3
        expect(Set.new Product.pluck(:code)).to eq Set.new [
          product_code_unique_1,
          product_code_unique_2,
          product_code_unique_3,
        ]
      end
    end
  end

  describe 'cost calculations' do
    describe 'fifo' do
      it 'returns the nth record from the last for a given product' do
        group1

        expect(Invoice.fifo product_code_unique_1, 13).to eq invoice6
      end

      it 'returns the nth record from the last for a given product - falsy' do
        group1
        expect(Invoice.fifo product_code_unique_1, 13).not_to eq invoice5
      end
    end

    describe :cost_calculator do
      it 'calculates the cost of a given product according to the fifo rule' do
        group1
        expect(Invoice.cost_calculator(product_code_unique_1, 13)[:value]).to eq 1000
      end

      it 'calculates the cost of a given product according to the fifo rule' do
        group1
        expect(Invoice.cost_calculator(product_code_unique_1, 1)[:value]).to eq 125
      end

      it 'calculates the cost of a given product according to the fifo rule' do
        group1
        expect(Invoice.cost_calculator(product_code_unique_1, 4)[:value]).to eq 125
      end

      it 'calculates the cost of a given product according to the fifo rule' do
        group1
        expect(Invoice.cost_calculator(product_code_unique_1, 5)[:value]).to eq 100
      end

      it 'calculates the cost of a given product according to the fifo rule - falsy' do
        group1
        expect(Invoice.cost_calculator(product_code_unique_1, 5)[:value]).not_to eq 101
      end

      it 'calculates the cost of a given product according to the fifo rule - last item' do
        group1
        expect(Invoice.cost_calculator(product_code_unique_1, 32)[:value]).to eq 1
      end

      it 'returns an error message when the nth is out of range' do
        group1
        expect(Invoice.cost_calculator(product_code_unique_1, 33)[:message]).to eq 'Invoice cannot be found'
      end

      it 'returns an error message when the product doesn\'t exist' do
        expect(Invoice.cost_calculator(product_code_unique_1, 33)[:message]).to eq 'Product doesn\'t exist.'
      end
    end
  end
end
