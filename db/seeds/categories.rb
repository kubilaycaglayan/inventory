def seed_categories
  puts "Seeding categories..."
  Category.create(kind: 'Bosch', definition: 'Solo')
  Category.create(kind: 'Bosch', definition: 'Ankastre')
  Category.create(kind: 'Bosch', definition: 'Küçük Ev Aleti')
  Category.create(kind: 'Bosch', definition: 'Klima')
  Category.create(kind: 'Bosch', definition: 'Primsiz')
  Category.create(kind: 'Bosch', definition: 'Televizyon')

  Category.create(kind: 'Muhasebe', definition: 'Çamaşır Makinesi')
  Category.create(kind: 'Muhasebe', definition: 'Bulaşık Makinesi')
  Category.create(kind: 'Muhasebe', definition: 'Buzdolabı')
  Category.create(kind: 'Muhasebe', definition: 'Fırın')
  Category.create(kind: 'Muhasebe', definition: 'Ocak')
  Category.create(kind: 'Muhasebe', definition: 'Davlumbaz')
  Category.create(kind: 'Muhasebe', definition: 'Televizyon')
  Category.create(kind: 'Muhasebe', definition: 'Küçük Ev Aleti')
  Category.create(kind: 'Muhasebe', definition: 'Elektrikli Süpürge')
  puts "Seeding categories done."
end
