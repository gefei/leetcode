var FrequencyTracker = function() {
    this.num_to_freq = {}
    this.freq_count = {}
};

FrequencyTracker.prototype.add = function(number) {
    let f = this.num_to_freq[number]
    if (f === undefined) f = 0
    this.num_to_freq[number] = f + 1

    let c = this.freq_count[f+1]
    if (c === undefined) c = 0
    this.freq_count[f+1] = c + 1
    if (f >= 1) this.freq_count[f]--
};

FrequencyTracker.prototype.deleteOne = function(number) {
    let f = this.num_to_freq[number]
    if (f === undefined || f === 0) return 
    this.num_to_freq[number]--

    this.freq_count[f]--
    if (f > 1) this.freq_count[f-1]++
};

FrequencyTracker.prototype.hasFrequency = function(frequency) {
    let f = this.freq_count[frequency]
    return (f !== undefined && f !== 0) 
};