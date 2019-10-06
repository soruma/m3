# frozen_string_literal: true

usually_use = Use.find_by(name: 'Usually use')
saving = Use.find_by(name: 'Saving')
investment = Use.find_by(name: 'Investment')

Account.seed(
  :id,
  [
    { id:  1, use: usually_use, name: 'Wallet' },
    { id:  2, use: usually_use, name: 'Wild rose bank' },
    { id:  3, use: usually_use, name: 'Yambaru credit card' },

    { id: 11, use: saving, name: 'Cash stash' },
    { id: 12, use: saving, name: 'Zerland bank' },

    { id: 21, use: investment, name: 'Developing nation index fund' },
    { id: 22, use: investment, name: 'Advanced nation index fund' },
    { id: 23, use: investment, name: 'Dividend emphasize fund' },
    { id: 24, use: investment, name: 'Yield on investments emphasize fund' }
  ]
)
