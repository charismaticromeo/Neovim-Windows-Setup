import sys

def greet(name):
    return f"Hello, {name}!"

if __name__ == "__main__":
    try:
        name = sys.argv[1]
        print(greet(name))
    except IndexError:
        print("\nPlease supply a name in the format: \n\t python3 test.py <name> ::::> Where name is user defined.")
    
