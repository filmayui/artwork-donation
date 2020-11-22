class Feeling < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'pop' },
    { id: 2, name: 'cool' },
    { id: 3, name: 'sweet' },
    { id: 4, name: 'happy' },
    { id: 5, name: 'sad' },
    { id: 6, name: 'relax' },
    { id: 7, name: 'lonely' },
    { id: 8, name: 'sleepy' },
    { id: 9, name: 'noisy' },
    { id: 10, name: 'abstract' },
    { id: 11, name: 'その他' }
  ]
end
