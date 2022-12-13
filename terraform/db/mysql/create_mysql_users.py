import sys

cmds = """CREATE USER '{{user}}'@'%' IDENTIFIED WITH mysql_native_password BY '{{user}}-secret'  PASSWORD EXPIRE INTERVAL 30 DAY;
GRANT ALL ON movielens.* TO '{{user}}'@'%';
GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO '{{user}}'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO '{{user}}'@'%';
"""


def process_file(input, output):
    with open(input) as f:
        content = f.read()
    users = content.split()

    with open(output, "w+") as f:
        for user in users:
            new_cmd = cmds.replace('{{user}}', user)
            print(new_cmd, file=f)


if __name__ == '__main__':
    input_file = sys.argv[1]
    output_file = sys.argv[2]

    process_file(input_file, output_file)
