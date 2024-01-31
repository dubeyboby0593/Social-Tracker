from flask import Flask, request, jsonify
from tracker import ip_track, phone_track, username_track

app = Flask(__name__)

@app.route('/execute-script', methods=['POST'])
def execute_script():
    data = request.get_json()  # Parse JSON data from the request

    option = data.get('option', '3')  # Default option for phone tracking
    user_input = data.get('userInput')

    try:
        if option == '1':
            result = ip_track(user_input)
        elif option == '3':
            result = phone_track(user_input)
        elif option == '4':
            result = username_track(user_input)
        else:
            return jsonify({"error": "Invalid option"}), 400

        return jsonify(result)
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
