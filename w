class Solution {
public:
    bool wordPattern(string pattern, string s) {

        vector<string> words;
        string word = "";

        // Split string into words
        for (char ch : s) {

            if (ch == ' ') {
                words.push_back(word);
                word = "";
            }
            else {
                word += ch;
            }
        }

        words.push_back(word);

        if (pattern.length() != words.size()) {
            return false;
        }

        unordered_map<char, string> map1;
        unordered_map<string, char> map2;

        for (int i = 0; i < pattern.length(); i++) {

            char ch = pattern[i];
            string w = words[i];

            if (map1.count(ch) && map1[ch] != w) {
                return false;
            }

            if (map2.count(w) && map2[w] != ch) {
                return false;
            }

            map1[ch] = w;
            map2[w] = ch;
        }

        return true;
    }
};
