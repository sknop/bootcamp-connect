import sys


def process_file(template, usernames, output):
    with open(template) as f:
        template_content = f.read()

    with open(usernames) as f:
        content = f.read()
    users = content.split()

    with open(output, "w+") as f:
        for user in users:
            new_cmd = template_content.replace('{{user}}', user).replace('{{user:upper}}', user.upper())
            print(new_cmd, file=f)


if __name__ == '__main__':
    template_file = sys.argv[1]
    input_file = sys.argv[2]
    output_file = sys.argv[3]

    process_file(template_file, input_file, output_file)
