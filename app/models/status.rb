class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '非常に良い' },
    { id: 3, name: '良い' },
    { id: 4, name: '可' },
    { id: 5, name: '悪い' },
    { id: 6, name: '非常に悪い' }
  ]
end
