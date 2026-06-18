"""
Python Golden Model for Processing Element (PE)

Operation:
    psum_out = a * w + psum

Features
--------
- INT8 Multiply-Accumulate
- 20-bit signed saturation
- Overflow detection
- Returns detailed verification information
"""

ACC_WIDTH = 20

MAX_POS = (1 << (ACC_WIDTH - 1)) - 1      # 524287
MIN_NEG = -(1 << (ACC_WIDTH - 1))         # -524288


class PEGoldenModel:

    def __init__(self):
        self.max_pos = MAX_POS
        self.min_neg = MIN_NEG

    def compute(self, a, w, psum):

        raw_result = a * w + psum

        overflow = False

        if raw_result > self.max_pos:
            overflow = True
            saturated_result = self.max_pos

        elif raw_result < self.min_neg:
            overflow = True
            saturated_result = self.min_neg

        else:
            saturated_result = raw_result

        return {
            "a": a,
            "w": w,
            "psum_in": psum,
            "raw_result": raw_result,
            "saturated_result": saturated_result,
            "overflow": overflow
        }


def print_result(result):

    print("-------------------------------------------")
    print(f"a                : {result['a']}")
    print(f"w                : {result['w']}")
    print(f"psum_in          : {result['psum_in']}")
    print(f"raw_result       : {result['raw_result']}")
    print(f"saturated_result : {result['saturated_result']}")
    print(f"overflow         : {result['overflow']}")
    print("-------------------------------------------\n")


if __name__ == "__main__":

    model = PEGoldenModel()

    test_vectors = [

        # Normal operation
        (3, 4, 0),

        # Accumulation
        (2, 5, 12),

        # Negative multiplication
        (-2, 6, 22),

        # Positive overflow
        (127, 127, 520000),

        # Negative overflow
        (-128, 127, -520000)

    ]

    print("\n========== PE GOLDEN MODEL ==========\n")

    for i, vector in enumerate(test_vectors):

        print(f"Test {i+1}")

        result = model.compute(
            vector[0],
            vector[1],
            vector[2]
        )

        print_result(result)

    print("Golden Model Verification Completed")
