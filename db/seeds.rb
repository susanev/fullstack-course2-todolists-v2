User.destroy_all

User.create! [
	{username: "Fiorina", password_digest: "123"},
	{username: "Trump", password_digest: "456"},
	{username: "Carson", password_digest: "789"},
	{username: "Clinton", password_digest: "012"},
]

User.find_by!(username: "Fiorina").create_profile(first_name: "Carly", last_name: "Fiorina", birth_year: "1954", gender: "female")
User.find_by!(username: "Trump").create_profile(first_name: "Donald", last_name: "Trump", birth_year: "1946", gender: "male")
User.find_by!(username: "Carson").create_profile(first_name: "Ben", last_name: "Carson", birth_year: "1951", gender: "male")
User.find_by!(username: "Clinton").create_profile(first_name: "Hillary", last_name: "Clinton", birth_year: "1947", gender: "female")

users = User.all.to_a

users.each {|user|
	list = TodoList.create(list_due_date: Date.today + 1.year, user: user)
	(1..5).each { |index|
		TodoItem.create(due_date: Date.today + 1.year, title: "title", description: "description", todo_list: list)
	}
}