class Motif < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '人物' },
    { id: 2, name: '動物' },
    { id: 3, name: '自然' },
    { id: 4, name: '風景' },
    { id: 5, name: '都市' },
    { id: 6, name: '抽象' },
    { id: 7, name: '宗教' },
    { id: 8, name: 'キャラクター' },
    { id: 9, name: 'その他' }
  ]
end

