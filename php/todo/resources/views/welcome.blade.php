<!DOCTYPE html>
<html>
<head>
    <title>My Awesome ToDo App</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="{{asset('bulma.css')}}">
    <script src="{{asset('vue.js')}}"></script>
</head>
<body>
    <div class="container">
        <section class="section">
            <h1 class="title">My Awesome ToDo App</h1>
            <p class="subtitle">Using Laravel 5, VueJS and <strong>Bulma</strong>!</p>
            <div class="todoapp">
                @verbatim
                    <header class="header">
                        <h1>Add a task</h1>
                        <input class="new-todo input" autofocus autocomplete="off" placeholder="What needs to be done?" v-model="newTodo" @keyup.enter="addTodo">
                    </header>
                    <br>
                    <div class="main" v-show="todos.length" v-cloak>
                        <label class="checkbox">
                            <input class="toggle-all" type="checkbox" v-model="allDone">
                            Toggle-all
                        </label>
                        <br>
                        <br>
                        <ul class="todo-list">
                            <li v-for="todo in filteredTodos" class="todo" :key="todo.id" :class="{ completed: todo.completed, editing: todo == editedTodo }">
                                <div class="view">
                                    <input class="toggle" type="checkbox" v-model="todo.completed">
                                    <input class="edit" type="text" v-model="todo.title" v-todo-focus="todo == editedTodo" @blur="doneEdit(todo)" @keyup.enter="doneEdit(todo)" @keyup.esc="cancelEdit(todo)">
                                    <button class="destroy button is-danger is-small is-outlined" @click="removeTodo(todo)">X</button>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <br>
                    <div class="" v-show="todos.length" v-cloak>
                        <div class="columns">
                            <div class="column">
                                <span class="todo-count">
                                    <strong>{{ remaining }}</strong> {{ remaining | pluralize }} left
                                </span>
                                <br>
                            </div>
                            <div class="column">
                                <a href="#/all" class="button" :class="{ 'is-link': visibility == 'all' }">All</a>
                                <a href="#/active" class="button" :class="{ 'is-link': visibility == 'active' }">Active</a>
                                <a href="#/completed" class="button" :class="{ 'is-link': visibility == 'completed' }">Completed</a>
                            </div>
                        </div>
                        <button class="button is-danger is-small clear-completed" @click="removeCompleted" v-show="todos.length > remaining">
                            Clear completed
                        </button>
                    </div>
                @endverbatim
            </div>
            <br>
            <footer class="footer">
                <div class="content has-text-centered">
                    <p>Based on <a href="https://vuejs.org/v2/examples/todomvc.html">VueJS ToDo example</a></p>
                </div>
            </footer>
        </section>
        
    </div>
    <script src="{{asset('app.js')}}"></script>
</body>
</html>
