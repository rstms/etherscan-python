"""
etherscan-python

A minimal, yet complete, python API for etherscan.io.

forked from: https://github.com/pcko1/etherscan-python

"""

from .modules.accounts import Accounts as accounts  # noqa: F401
from .modules.blocks import Blocks as blocks  # noqa: F401
from .modules.contracts import Contracts as contracts  # noqa: F401
from .modules.gastracker import GasTracker as gastracker  # noqa: F401
from .modules.pro import Pro as pro  # noqa: F401
from .modules.proxy import Proxy as proxy  # noqa: F401
from .modules.stats import Stats as stats  # noqa: F401
from .modules.tokens import Tokens as tokens  # noqa: F401
from .modules.transactions import Transactions as transactions  # noqa: F401
