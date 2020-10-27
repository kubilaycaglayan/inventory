require 'rails_helper'

RSpec.describe Invoice, type: :model do
  let(:invoice_number) { 0001 }
  let(:pen_number) { 010 }
  let(:quantity) { 1 }
  let(:tax_kdv) { 18.0 }
  let(:tax_otv) { 15.5 }
  let(:definition) { 'Refrigerator' }
  let(:value_date) { '2025-02-15' }
  let(:sum) { 1550.50 }
  let(:product_code) { 'WAT24480TR' }

  let(:invoice1) { Invoice.new(
    invoice_number: invoice_number,
    pen_number: pen_number,
    quantity: quantity,
    tax_kdv: tax_kdv,
    tax_otv: tax_otv,
    definition: definition,
    value_date: value_date,
    sum: sum,
    product_code: product_code
  )}

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
          expect(invoice1.product_code).to eq product_code
        end

        it 'has an String data type - falsy' do
          expect(invoice1.product_code).not_to be_an_instance_of Integer
        end

        it 'successfully stores the value - falsy' do
          expect(invoice1.product_code).not_to be product_code + '1'
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

      it 'saves multiple records even if they have not uniqe ones among them' do
        invoice2 = invoice1.dup
        invoice3 = invoice1.dup
        invoice4 = invoice1.dup
        invoice5 = invoice1.dup
        invoice6 = invoice1.dup

        print invoice3.pen_number = (rand * 10000).ceil
        print invoice4.pen_number = invoice3.pen_number + 1
        print invoice5.pen_number = invoice3.pen_number + 2
        print invoice6.pen_number = invoice3.pen_number + 3

        Invoice.insert_all [invoice1.as_json, invoice2.as_json, invoice3.as_json, invoice4.as_json, invoice5.as_json, invoice6.as_json]

      end
    end
  end

  describe 'triggers' do
    describe 'automatically adds new products into the products table' do

    end
  end

end
