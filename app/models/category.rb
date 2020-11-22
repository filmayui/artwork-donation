class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '水彩画' },
    { id: 2, name: 'イラスト' },
    { id: 3, name: 'ペン画' },
    { id: 4, name: '切り絵' },
    { id: 5, name: 'ランドアート' },
    { id: 6, name: 'ドローイング' },
    { id: 7, name: 'コラージュ' },
    { id: 8, name: '写真' },
    { id: 9, name: 'ポスター' },
    { id: 10, name: 'ポストカード' },
    { id: 11, name: 'ハンドメイド' },
    { id: 12, name: '彫刻・立体' },
    { id: 13, name: 'その他' }
  ]
end

