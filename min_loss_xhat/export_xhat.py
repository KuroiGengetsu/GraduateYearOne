# 导入 正则表达式 re 库, csv 操作库, 系统操作库 os
import re
import csv
import os

# https://paste.ubuntu.com/p/6SKm9gdVQD/

# LOSS_RE 用来匹配 loss 的数值部分
LOSS_RE = re.compile('loss:(\d[.]\d*)')
# XHAT_RE 用来匹配 xhat
XHAT_RE = re.compile('x_hat.*?]]')
# TXT_RE 用来匹配 数字.txt 文件名
TXT_RE = re.compile('T\d*.txt')

# 分量 Components
COMP_RE = re.compile('\d*[.]\d*')


def min_index(losses):
    """
    :param losses: 传入 losses 列表
    :return: 返回 最大值对应的位置 组成的 列表
    """
    return [i for i, loss in enumerate(losses) if loss == min(losses)]


def min_loss_return_xhat(filename):
    """
    :param filename: txt 对应的文件名(要求完整名字)
    将结果写入文件中
    """
    # 两个列表用来存放匹配到的值
    losses = []
    xhats = []

    # 打开 filename 文件，读取每一行的 loss 与 xhat 并放到上面两个列表中
    with open(filename, 'r') as f:
        # 对于文件中的每一行, i 是行数-1(也就是索引), line 是该行的字符串
        for i, line in enumerate(f.readlines()):
            # 找到 loss 对应数值
            loss = LOSS_RE.search(line)
            if loss:
                # 如果 loss 存在, 就把 loss 添加到 losses 中, 并且变成 float 类型
                losses.append(float(loss.group(1)))
            else:
                # 否则抛出错误, 并打印对应的文件名与行数
                raise ValueError('loss not found at {0} and line {1}'.format(filename, i+1))

            # 找到 xhat 对应的字符串
            xhat = XHAT_RE.search(line)
            if xhat:
                # 如果 xhat 存在, 就把 xhat 添加到 xhats 中, 依然是字符串
                xhats.append(xhat.group())
            else:
                # 否则抛出错误, 并打印对应的文件名与行数
                raise ValueError('xhat not found at {0} and line {1}'.format(filename, i+1))

    # 将结果写入 csv 文件中, a+ 保证了 创建新文件/在文件末尾添加, newline 是防止 csv 文件出现空行
    with open('xhat_result.csv', 'a+', newline='') as f:
        result_writer = csv.writer(f)
        # 将该文件中 文件名 + 行数 + loss的数值 + xhat 的三个分量 写入 csv 文件中, 如果有两个 loss 最大值, 则分多行写入
        for i in min_index(losses):
            result_writer.writerow([filename, 'line:{0}'.format(i+1), 'loss:', losses[i], 'x_hat:']
                                   + COMP_RE.findall(xhats[i]))


# 主函数
if __name__ == '__main__':
    # 找出当前目录的所有文件
    for filename in os.listdir('./'):
        # 对以 'T数字.txt' 为名的文件进行处理
        filename = TXT_RE.match(filename)
        if filename:
            min_loss_return_xhat(filename.group())
