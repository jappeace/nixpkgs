import json


from test_driver.machine import Machine
from typing import Any, Dict


class Driver:
    def create_machine(self, args: Dict[str, Any]) -> Machine:
        print("creating" + json.dumps(args, indent=4))
        return Machine()
