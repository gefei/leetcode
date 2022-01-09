class AllOne:
    def __init__(self):
        self.key_2_count: defaultdict[(str, int)] = defaultdict()
        self.count_2_key: defaultdict[(int, set[str])] = defaultdict()

    def inc(self, key: str) -> None:
        c = self.key_2_count.get(key, 0)
        self.key_2_count[key] = c+1

        new_keys = self.count_2_key.get(c+1, set())
        new_keys.add(key)
        self.count_2_key[c+1] = new_keys
        old_keys: set[str] = self.count_2_key.get(c)
        if not old_keys is None and key in old_keys:
            old_keys.remove(key)
            if len(old_keys) > 0:
                self.count_2_key[c] = old_keys
            else:
                del self.count_2_key[c]

    def dec(self, key: str) -> None:
        c = self.key_2_count.get(key)
        if c > 1:
            self.key_2_count[key] = c-1
            self.count_2_key[c].remove(key)
            minus_1: set(str) = self.count_2_key.get(c-1, set())
            minus_1.add(key)
            self.count_2_key[c-1] = minus_1
        else:
            del self.key_2_count[key]
            self.count_2_key[c].remove(key)
        if len(self.count_2_key[c]) == 0:
           del self.count_2_key[c]

    def getMaxKey(self) -> str:
        keys = self.count_2_key.keys()
        if len(keys) == 0:
            return ''
        x = max(keys)
        for e in self.count_2_key[x]:
            break
        return e
        

    def getMinKey(self) -> str:
        keys = self.count_2_key.keys()
        if len(keys) == 0:
            return ''
        x = min(self.count_2_key.keys())
        for e in self.count_2_key[x]:
            break
        return e

allone = AllOne()
allone.inc('a')
allone.inc('b')
allone.inc('b')
allone.inc('b')
allone.inc('b')
allone.dec('b')
#allone.dec('b')
print(allone.getMaxKey())
print(allone.getMinKey())
