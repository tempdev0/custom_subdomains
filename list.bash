!/bin/bash
#Simple Bash Script For Make Subdomains

# Check if domain and wordlist file are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <domain> <wordlist>"
    echo "Example: $0 exmaple.com top-5000-words.txt"
    exit 1
fi
domain="$1"
wordlist="$2"

# Check if wordlist file exists
if [ ! -f "$wordlist" ]; then
    echo "Wordlist file not found: $wordlist"
    exit 1
fi

# Read each word from the wordlist file and concatenate with domain.Output to the enterddomain.com_all_subs.txt
echo ''
echo "Making Subdomains For Domain:$1 with Wordlist:$2 "
echo ''
for word in $(cat $2);do
    subdomain="${word}.${domain}"
    echo "$subdomain"
done | tee "$1_subdomains.txt"
echo ""
echo "Maked Subdomains Are Saved In The $1_subdomains.txt"
