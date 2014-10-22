describe "GildedRose", ->
  When -> @item = new Item @name, @sellIn, @quality
  When -> GildedRose.updateQuality [ @item ]
  Given -> @quality = 5

  describe 'normal stuff', ->
    Given -> @name    = '+5 Dexterity Vest'
    describe 'before sellIn date', ->
      Given -> @sellIn = 1
      Then  -> expect(@item.quality).toBe 4
    describe 'after sellIn date', ->
      Given -> @sellIn = 0
      Then  -> expect(@item.quality).toBe 3
    describe 'quality is never less than zero', ->
      describe 'before sellIn', ->
        Given -> @sellIn = 1
        Given -> @quality = 0
        Then  -> expect(@item.quality).toBe 0
      describe 'after sellIn', ->
        Given -> @sellIn = 0
        Given -> @quality = 1
        Then  -> expect(@item.quality).toBe 0

  describe 'Aged Brie', ->
    Given -> @name    = 'Aged Brie'
    describe 'before sellIn date', ->
      Given -> @sellIn = 1
      Then  -> expect(@item.quality).toBe 6
    describe 'after sellIn date', ->
      Given -> @sellIn = 0
      Then  -> expect(@item.quality).toBe 7

    describe 'quality is never more than 50', ->
      describe 'before sellIn', ->
        Given -> @sellIn = 1
        Given -> @quality = 50
        Then  -> expect(@item.quality).toBe 50
      describe 'after sellIn', ->
        Given -> @sellIn = 0
        Given -> @quality = 49
        Then  -> expect(@item.quality).toBe 50

    describe 'Sulfuras', ->
      Given -> @name = 'Sulfuras, Hand of Ragnaros'
      describe 'before sellIn', ->
        Given -> @sellIn = 1
        Then  -> expect(@item.quality).toBe 5
      describe 'after sellIn', ->
        Given -> @sellIn = 0
        Then  -> expect(@item.quality).toBe 5

    describe 'backstage passes', ->
      Given -> @name = 'Backstage passes to a TAFKAL80ETC concert'
      describe 'when concert is more than 10 days away', ->
        Given -> @sellIn = 11
        Then  -> expect(@item.quality).toBe 6
      describe 'when concert is 10 or less days away', ->
        Given -> @sellIn = 10
        Then  -> expect(@item.quality).toBe 7
      describe 'when concert is 5 or less days away', ->
        Given -> @sellIn = 5
        Then  -> expect(@item.quality).toBe 8
      describe 'when concert is over', ->
        Given -> @sellIn = 0
        Then  -> expect(@item.quality).toBe 0
